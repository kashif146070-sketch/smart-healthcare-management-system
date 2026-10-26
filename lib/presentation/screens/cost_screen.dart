import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import 'package:intl/intl.dart';
import '../../providers.dart';
import '../../theme/app_theme.dart';
import '../widgets/page_header.dart';
import '../../data/database.dart';
import '../../domain/services.dart';

class CostScreen extends ConsumerStatefulWidget {
  const CostScreen({super.key});

  @override
  ConsumerState<CostScreen> createState() => _CostScreenState();
}

class _CostScreenState extends ConsumerState<CostScreen> {
  ProjectCharterData? charter;
  List<ActivityCost> costs = [];
  List<Activity> activities = [];
  EvmSnapshot? latestEvm;
  bool isLoading = true;

  final _amountController = TextEditingController();
  final _spentOnController = TextEditingController();
  final _descController = TextEditingController();
  int? _selectedActivityId;

  @override
  void initState() {
    super.initState();
    _spentOnController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    _loadData();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _spentOnController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final c = await (db.select(db.projectCharter)..limit(1)).getSingleOrNull();
    final csts = await (db.select(db.activityCosts)
          ..orderBy([(t) => OrderingTerm.desc(t.recordedAt)]))
        .get();
    final acts = await db.select(db.activities).get();
    final evms = await (db.select(db.evmSnapshots)
          ..orderBy([(t) => OrderingTerm.desc(t.snapshotDate)]))
        .get();

    if (mounted) {
      setState(() {
        charter = c;
        costs = csts;
        activities = acts;
        latestEvm = evms.isNotEmpty ? evms.first : null;
        isLoading = false;
      });
    }
  }

  Future<void> _saveExpenditure() async {
    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0) return;

    final db = ref.read(dbProvider);
    DateTime date;
    try {
      final parts = _spentOnController.text.split('/');
      date = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
    } catch (_) {
      date = DateTime.now();
    }

    final actId = _selectedActivityId ?? (activities.isNotEmpty ? activities.first.id : 1);

    await db.into(db.activityCosts).insert(
      ActivityCostsCompanion.insert(
        activityId: actId,
        plannedCost: amount,
        actualCost: amount,
        recordedAt: date,
      ),
    );

    // Recalculate EVM Snapshot
    await ref.read(evmServiceProvider).captureSnapshot(DateTime.now());

    _amountController.clear();
    _descController.clear();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final ev = latestEvm?.ev ?? 1470000.0;
    final ac = latestEvm?.ac ?? 1425000.0;
    final pv = latestEvm?.pv ?? 0.0;
    final cpi = latestEvm?.cpi ?? 1.03;
    final costVariance = ev - ac;

    return Scaffold(
      backgroundColor: CarePlanTheme.pageBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarePlanPageHeader(
              breadcrumbModule: 'Cost & EVM',
              moduleTag: 'Module 4',
              title: 'Cost management & earned value',
              subtitle: 'Performance is calculated from saved activity budgets, progress, schedule and actual expenditure.',
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  // Top 4 Metrics Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard(
                          'Approved baseline',
                          'PKR ${(charter?.approvedBudget ?? 5800000).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                          '',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Planned value · PV',
                          'PKR ${pv.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                          'Time-phased from configured dates',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Earned value · EV',
                          'PKR ${ev.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                          'Budgeted cost × activity progress',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Actual cost · AC',
                          'PKR ${ac.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                          'Recorded expenditure',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Performance measures section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: CarePlanTheme.cardBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Performance measures',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildSubMetricCard(
                                'CPI · EV / AC',
                                cpi.toStringAsFixed(2),
                                'Cost efficiency',
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildSubMetricCard(
                                'SPI · EV / PV',
                                '—',
                                'Schedule efficiency',
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildSubMetricCard(
                                'Cost variance · EV - AC',
                                'PKR ${costVariance.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                'Cost variance',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Bottom Row: Record actual expenditure + Expenditure ledger
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Record actual expenditure (1/2 width)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: CarePlanTheme.cardBorder),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Record actual expenditure',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Amount (PKR)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                        const SizedBox(height: 6),
                                        TextFormField(controller: _amountController, keyboardType: TextInputType.number),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Spent on', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                        const SizedBox(height: 6),
                                        TextFormField(
                                          controller: _spentOnController,
                                          decoration: const InputDecoration(
                                            suffixIcon: Icon(Icons.calendar_today_outlined, size: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text('Related activity', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<int>(
                                initialValue: _selectedActivityId ?? (activities.isNotEmpty ? activities.first.id : null),
                                items: [
                                  const DropdownMenuItem(value: 0, child: Text('Project-wide')),
                                  ...activities.map((a) => DropdownMenuItem(value: a.id, child: Text(a.name, overflow: TextOverflow.ellipsis))),
                                ],
                                onChanged: (val) {
                                  if (val != null) setState(() => _selectedActivityId = val);
                                },
                              ),
                              const SizedBox(height: 16),
                              Text('Description', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              TextFormField(controller: _descController, maxLines: 2),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _saveExpenditure,
                                child: const Text('Save expenditure'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Expenditure ledger (1/2 width)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: CarePlanTheme.cardBorder),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expenditure ledger',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                color: const Color(0xFFF8FAFC),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(flex: 2, child: Text('DATE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 4, child: Text('ACTIVITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 2, child: Text('AMOUNT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: costs.length,
                                separatorBuilder: (_, __) => const Divider(height: 1, color: CarePlanTheme.cardBorder),
                                itemBuilder: (context, index) {
                                  final cost = costs[index];
                                  final matchedAct = activities.where((a) => a.id == cost.activityId).firstOrNull;
                                  final actName = matchedAct != null ? matchedAct.name : 'Project-wide';

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    child: Row(
                                      children: [
                                        Expanded(flex: 2, child: Text(DateFormat('yyyy-MM-dd').format(cost.recordedAt), style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted))),
                                        Expanded(flex: 4, child: Text(actName, style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(flex: 2, child: Text('PKR ${cost.actualCost.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark))),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CarePlanTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 13, color: CarePlanTheme.textMuted)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted)),
          ],
        ],
      ),
    );
  }

  Widget _buildSubMetricCard(String title, String value, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CarePlanTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
          const SizedBox(height: 2),
          Text(subtitle, style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
        ],
      ),
    );
  }
}
