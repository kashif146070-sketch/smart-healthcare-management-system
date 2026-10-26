import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../providers.dart';
import '../../theme/app_theme.dart';
import '../widgets/page_header.dart';
import '../../data/database.dart';

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
  ProjectCharterData? charter;
  List<ChangeRequest> changeRequests = [];
  List<Risk> risks = [];
  List<Requirement> requirements = [];
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
    final crs = await db.select(db.changeRequests).get();
    final rsks = await (db.select(db.risks)..orderBy([(t) => OrderingTerm.desc(t.score)])).get();
    final reqs = await db.select(db.requirements).get();
    final evms = await (db.select(db.evmSnapshots)
          ..orderBy([(t) => OrderingTerm.desc(t.snapshotDate)]))
        .get();

    if (mounted) {
      setState(() {
        charter = c;
        changeRequests = crs;
        risks = rsks;
        requirements = reqs;
        latestEvm = evms.isNotEmpty ? evms.first : null;
        isLoading = false;
      });
    }
  }

  Future<void> _exportPdfReport() async {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('CarePlan Project Management - System Integration & Reporting', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 16),
              pw.Text('Project Title: ${charter?.projectName ?? "Healthcare application delivery"}'),
              pw.Text('Approved Budget: PKR ${(charter?.approvedBudget ?? 5800000).toInt()}'),
              pw.Text('Duration: 19 weeks'),
              pw.SizedBox(height: 16),
              pw.Text('EVM Status:', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.Text('PV: PKR ${latestEvm?.pv.toInt() ?? 0} | EV: PKR ${latestEvm?.ev.toInt() ?? 1470000} | AC: PKR ${latestEvm?.ac.toInt() ?? 1425000}'),
              pw.Text('CPI: ${latestEvm?.cpi.toStringAsFixed(2) ?? "1.03"}'),
              pw.SizedBox(height: 16),
              pw.Text('Approved Change Requests:', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              ...changeRequests.map((cr) => pw.Text('- ${cr.title}: +PKR ${cr.costImpact.toInt()} (${cr.scheduleImpactDays ~/ 7} weeks)')),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
      name: 'CarePlan_System_Report.pdf',
    );
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

    return Scaffold(
      backgroundColor: CarePlanTheme.pageBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarePlanPageHeader(
              breadcrumbModule: 'Reports',
              moduleTag: 'Module 6',
              title: 'System integration & reporting',
              subtitle: 'Integrated report generated from the same persistent project database.',
              action: Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: _exportPdfReport,
                    icon: const Icon(Icons.picture_as_pdf, size: 16),
                    label: const Text('Export PDF'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: CarePlanTheme.textDark,
                      side: const BorderSide(color: Color(0xFFCBD5E1)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: _loadData,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: CarePlanTheme.textDark,
                      side: const BorderSide(color: Color(0xFFCBD5E1)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Refresh report'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  // Top Section: Project baseline & EVM report (4 Cards)
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
                          'Project baseline & EVM report',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildReportMetricCard(
                                'Approved budget',
                                'PKR ${(charter?.approvedBudget ?? 5800000).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildReportMetricCard(
                                'Approved duration',
                                '19 weeks',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildReportMetricCard(
                                'PV / EV / AC',
                                'PKR ${pv.toInt()} / PKR ${ev.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} / PKR ${ac.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildReportMetricCard(
                                'CPI / SPI',
                                '${cpi.toStringAsFixed(2)} / —',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Middle Row: Change request decisions + Risk prioritization
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Change request decisions (1/2 width)
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
                                'Change request decisions',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                color: const Color(0xFFF8FAFC),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(flex: 3, child: Text('CHANGE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 2, child: Text('COST', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 1, child: Text('WEEKS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 2, child: Text('STATUS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: changeRequests.length,
                                separatorBuilder: (_, __) => const Divider(height: 1, color: CarePlanTheme.cardBorder),
                                itemBuilder: (context, index) {
                                  final cr = changeRequests[index];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    child: Row(
                                      children: [
                                        Expanded(flex: 3, child: Text(cr.title, style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(flex: 2, child: Text('PKR ${cr.costImpact.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}', style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(flex: 1, child: Text('${cr.scheduleImpactDays ~/ 7}', style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(flex: 2, child: Row(children: [CarePlanBadge.approved()])),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Risk prioritization (1/2 width)
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
                                'Risk prioritization',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                color: const Color(0xFFF8FAFC),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(flex: 4, child: Text('RISK', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 1, child: Text('SCORE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 1, child: Text('PRIORITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: risks.length,
                                separatorBuilder: (_, __) => const Divider(height: 1, color: CarePlanTheme.cardBorder),
                                itemBuilder: (context, index) {
                                  final risk = risks[index];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    child: Row(
                                      children: [
                                        Expanded(flex: 4, child: Text(risk.title, style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(flex: 1, child: Text('${risk.score}/25', style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(flex: 1, child: Text(risk.status, style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted))),
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
                  const SizedBox(height: 24),

                  // Bottom Section: Baseline scope register
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
                          'Baseline scope register',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          color: const Color(0xFFF8FAFC),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(flex: 4, child: Text('REQUIREMENT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                              Expanded(flex: 2, child: Text('PRIORITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                              Expanded(flex: 2, child: Text('STATUS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                            ],
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: requirements.length,
                          separatorBuilder: (_, __) => const Divider(height: 1, color: CarePlanTheme.cardBorder),
                          itemBuilder: (context, index) {
                            final req = requirements[index];
                            final isApproved = req.isInScope || req.status == 'approved';

                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(flex: 4, child: Text(req.title, style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                  Expanded(flex: 2, child: Text(req.priority, style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted))),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        isApproved ? CarePlanBadge.approved() : CarePlanBadge.proposed(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportMetricCard(String title, String value) {
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
          Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
        ],
      ),
    );
  }
}
