import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../providers.dart';
import '../../theme/app_theme.dart';
import '../widgets/page_header.dart';
import '../../data/database.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class WorkPackageChartData {
  final String title;
  final double plannedValue;
  final double earnedValue;

  WorkPackageChartData(this.title, this.plannedValue, this.earnedValue);
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  ProjectCharterData? charter;
  List<Activity> activities = [];
  List<ChangeRequest> changeRequests = [];
  List<Defect> defects = [];
  EvmSnapshot? latestEvm;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final c = await (db.select(db.projectCharter)..limit(1)).getSingleOrNull();
    final acts = await db.select(db.activities).get();
    final crs = await db.select(db.changeRequests).get();
    final defs = await db.select(db.defects).get();
    final evms = await (db.select(db.evmSnapshots)
          ..orderBy([(t) => OrderingTerm.desc(t.snapshotDate)]))
        .get();

    if (mounted) {
      setState(() {
        charter = c;
        activities = acts;
        changeRequests = crs;
        defects = defs;
        latestEvm = evms.isNotEmpty ? evms.first : null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final pendingCrsCount = changeRequests.where((cr) => cr.status.toLowerCase() == 'pending').length;
    final delayedCount = activities.where((a) => a.status.toLowerCase() == 'delayed').length;
    final criticalDefects = defects.where((d) => d.severity.toLowerCase() == 'critical' && d.status.toLowerCase() == 'open').length;

    // Calculate Overall Progress
    double avgProgress = 0.0;
    if (activities.isNotEmpty) {
      avgProgress = activities.fold(0.0, (sum, a) => sum + a.percentComplete) / activities.length;
    }

    final chartDataList = [
      WorkPackageChartData('Initiation & reqs', 500000, 500000),
      WorkPackageChartData('Solution design', 700000, 460000),
      WorkPackageChartData('Patient appointments', 880000, 310000),
      WorkPackageChartData('Lab & schedules', 790000, 200000),
      WorkPackageChartData('Consultations & billing', 600000, 0),
      WorkPackageChartData('Integration testing', 600000, 0),
      WorkPackageChartData('UAT & defect res.', 880000, 0),
      WorkPackageChartData('Release readiness', 400000, 0),
      WorkPackageChartData('AI diagnosis module', 400000, 0),
      WorkPackageChartData('Mobile application', 400000, 0),
    ];

    return Scaffold(
      backgroundColor: CarePlanTheme.pageBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarePlanPageHeader(
              breadcrumbModule: 'Dashboard',
              moduleTag: 'Project Overview',
              title: charter?.projectName ?? 'Healthcare application delivery',
              subtitle: 'Five-hospital network · ${charter?.status ?? "Planning"} · Baseline: 19 weeks',
              action: OutlinedButton(
                onPressed: _loadData,
                style: OutlinedButton.styleFrom(
                  foregroundColor: CarePlanTheme.textDark,
                  side: const BorderSide(color: Color(0xFFCBD5E1)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Refresh overview'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  // 4 Metric Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard(
                          'Overall progress',
                          '${avgProgress.toInt()}%',
                          '7 approved requirements',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Approved budget',
                          'PKR ${(charter?.approvedBudget ?? 5800000).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                          '19 week baseline',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Pending changes',
                          '$pendingCrsCount',
                          'Awaiting a decision',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Late activities',
                          '$delayedCount',
                          delayedCount == 0 ? 'On track' : 'Action required',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Middle Row: Earned Value Snapshot + Performance Indicators
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left (2/3 width)
                      Expanded(
                        flex: 2,
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
                                'Earned value snapshot',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  _buildLegendItem('Planned value', const Color(0xFFCBD5E1)),
                                  const SizedBox(width: 20),
                                  _buildLegendItem('Earned value', CarePlanTheme.primaryTeal),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 320,
                                child: SfCartesianChart(
                                  primaryXAxis: const CategoryAxis(
                                    labelRotation: -30,
                                    labelStyle: TextStyle(fontSize: 10, color: CarePlanTheme.textMuted),
                                  ),
                                  primaryYAxis: const NumericAxis(
                                    maximum: 1000000,
                                    interval: 250000,
                                    labelFormat: '{value}',
                                    numberFormat: null,
                                  ),
                                  series: <CartesianSeries<WorkPackageChartData, String>>[
                                    ColumnSeries<WorkPackageChartData, String>(
                                      dataSource: chartDataList,
                                      xValueMapper: (WorkPackageChartData data, _) => data.title,
                                      yValueMapper: (WorkPackageChartData data, _) => data.plannedValue,
                                      color: const Color(0xFFE2E8F0),
                                      width: 0.4,
                                    ),
                                    ColumnSeries<WorkPackageChartData, String>(
                                      dataSource: chartDataList,
                                      xValueMapper: (WorkPackageChartData data, _) => data.title,
                                      yValueMapper: (WorkPackageChartData data, _) => data.earnedValue,
                                      color: CarePlanTheme.primaryTeal,
                                      width: 0.4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Right (1/3 width): Performance indicators
                      Expanded(
                        flex: 1,
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
                                'Performance indicators',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildIndicatorRow('PV', 'PKR ${(latestEvm?.pv ?? 0).toInt()}'),
                              const Divider(height: 24, color: CarePlanTheme.cardBorder),
                              _buildIndicatorRow('EV', 'PKR ${(latestEvm?.ev ?? 1470000).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'),
                              const Divider(height: 24, color: CarePlanTheme.cardBorder),
                              _buildIndicatorRow('AC', 'PKR ${(latestEvm?.ac ?? 1425000).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'),
                              const Divider(height: 24, color: CarePlanTheme.cardBorder),
                              _buildIndicatorRow('CPI', latestEvm?.cpi.toStringAsFixed(2) ?? '1.03'),
                              const Divider(height: 24, color: CarePlanTheme.cardBorder),
                              _buildIndicatorRow('SPI', '—'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Bottom Row: Critical Defects + Deadline & Milestones
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Critical defects
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
                                'Critical defects',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    '$criticalDefects',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: CarePlanTheme.statusRedText,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'unresolved critical defects',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CarePlanTheme.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Appointment scheduling and patient record management are tracked in Quality & Risk.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: CarePlanTheme.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Deadline & Milestones
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
                                'Deadline & milestones',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Baseline deadline', style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted)),
                                      const SizedBox(height: 2),
                                      Text('2027-03-07', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Forecast deadline', style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted)),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Text('2027-03-07', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                          const SizedBox(width: 8),
                                          CarePlanBadge.inProgress('On track'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(height: 24, color: CarePlanTheme.cardBorder),
                              _buildMilestoneRow('Requirements and initiation complete', '2026-11-08', CarePlanBadge.complete()),
                              const SizedBox(height: 10),
                              _buildMilestoneRow('Approved healthcare features complete', '2027-01-03', CarePlanBadge.pending('Pending')),
                              const SizedBox(height: 10),
                              _buildMilestoneRow('User acceptance and defect resolution complete', '2027-01-31', CarePlanBadge.pending('Pending')),
                              const SizedBox(height: 10),
                              _buildMilestoneRow('Release readiness and project closure', '2027-02-14', CarePlanBadge.pending('Pending')),
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
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: CarePlanTheme.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CarePlanTheme.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: CarePlanTheme.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted),
        ),
      ],
    );
  }

  Widget _buildIndicatorRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13, color: CarePlanTheme.textMuted),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
        ),
      ],
    );
  }

  Widget _buildMilestoneRow(String name, String date, Widget badge) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted),
          ),
        ),
        Text(
          date,
          style: TextStyle(fontSize: 11, color: CarePlanTheme.textLight),
        ),
        const SizedBox(width: 8),
        badge,
      ],
    );
  }
}
