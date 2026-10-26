import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show OrderingTerm, Value;
import '../../providers.dart';
import '../../theme/app_theme.dart';
import '../widgets/page_header.dart';
import '../../data/database.dart';

class QualityScreen extends ConsumerStatefulWidget {
  const QualityScreen({super.key});

  @override
  ConsumerState<QualityScreen> createState() => _QualityScreenState();
}

class _QualityScreenState extends ConsumerState<QualityScreen> {
  List<Defect> defects = [];
  List<QualityChecklistItem> checklistItems = [];
  List<Risk> risks = [];
  List<TeamMember> teamMembers = [];
  bool isLoading = true;

  final _defectTitleController = TextEditingController();
  final _defectDescController = TextEditingController();
  String _defectSeverity = 'High';
  int? _defectAssignedTo;

  final _deliverableController = TextEditingController();
  final _checkItemController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _defectTitleController.dispose();
    _defectDescController.dispose();
    _deliverableController.dispose();
    _checkItemController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final defs = await db.select(db.defects).get();
    final chks = await db.select(db.qualityChecklistItems).get();
    final rsks = await (db.select(db.risks)..orderBy([(t) => OrderingTerm.desc(t.score)])).get();
    final members = await db.select(db.teamMembers).get();

    if (mounted) {
      setState(() {
        defects = defs;
        checklistItems = chks;
        risks = rsks;
        teamMembers = members;
        isLoading = false;
      });
    }
  }

  Future<void> _addDefect() async {
    if (_defectTitleController.text.trim().isEmpty) return;

    final db = ref.read(dbProvider);
    await db.into(db.defects).insert(
      DefectsCompanion.insert(
        moduleName: Value(_defectTitleController.text.trim()),
        description: _defectDescController.text.trim(),
        severity: _defectSeverity,
        assignedTo: Value(_defectAssignedTo),
        status: 'Open',
        reportedAt: DateTime.now(),
      ),
    );

    _defectTitleController.clear();
    _defectDescController.clear();
    _loadData();
  }

  Future<void> _addChecklistItem() async {
    if (_deliverableController.text.trim().isEmpty || _checkItemController.text.trim().isEmpty) return;

    final db = ref.read(dbProvider);
    await db.into(db.qualityChecklistItems).insert(
      QualityChecklistItemsCompanion.insert(
        deliverable: _deliverableController.text.trim(),
        criterion: _checkItemController.text.trim(),
        inspectionResult: 'Not inspected',
      ),
    );

    _deliverableController.clear();
    _checkItemController.clear();
    _notesController.clear();
    _loadData();
  }

  Future<void> _updateDefectStatus(Defect defect, String newStatus) async {
    final db = ref.read(dbProvider);
    await db.update(db.defects).replace(defect.copyWith(status: newStatus));
    _loadData();
  }

  Future<void> _updateChecklistStatus(QualityChecklistItem item, String newStatus) async {
    final db = ref.read(dbProvider);
    await db.update(db.qualityChecklistItems).replace(item.copyWith(inspectionResult: newStatus));
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: CarePlanTheme.pageBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarePlanPageHeader(
              breadcrumbModule: 'Quality & Risk',
              moduleTag: 'Module 5',
              title: 'Quality management & risk control',
              subtitle: 'Track defects, inspect deliverables and prioritize risks with preventive and contingency responses.',
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  // Top Section: Defect register
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
                          'Defect register',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: defects.map((defect) {
                            final assignedMember = teamMembers.where((m) => m.id == defect.assignedTo).firstOrNull;
                            final assignedName = assignedMember != null ? assignedMember.name : 'Backend Developer 1';

                            return Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: CarePlanTheme.statusRedText.withValues(alpha: 0.3)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          defect.moduleName ?? 'Defect',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                                        ),
                                        CarePlanBadge.critical(defect.severity),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      defect.description,
                                      style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Assigned: $assignedName',
                                      style: TextStyle(fontSize: 11, color: CarePlanTheme.textDark, fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 12),
                                    Text('Resolution status', style: TextStyle(fontSize: 10, color: CarePlanTheme.textMuted)),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      height: 38,
                                      child: DropdownButtonFormField<String>(
                                        initialValue: defect.status,
                                        items: const [
                                          DropdownMenuItem(value: 'Open', child: Text('Open', style: TextStyle(fontSize: 12))),
                                          DropdownMenuItem(value: 'In Progress', child: Text('In Progress', style: TextStyle(fontSize: 12))),
                                          DropdownMenuItem(value: 'Resolved', child: Text('Resolved', style: TextStyle(fontSize: 12))),
                                          DropdownMenuItem(value: 'Closed', child: Text('Closed', style: TextStyle(fontSize: 12))),
                                        ],
                                        onChanged: (val) {
                                          if (val != null) _updateDefectStatus(defect, val);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),

                        // Form below to add new defect
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Defect title', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                  const SizedBox(height: 6),
                                  TextFormField(controller: _defectTitleController),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Severity', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                  const SizedBox(height: 6),
                                  DropdownButtonFormField<String>(
                                    initialValue: _defectSeverity,
                                    items: const [
                                      DropdownMenuItem(value: 'Critical', child: Text('Critical')),
                                      DropdownMenuItem(value: 'High', child: Text('High')),
                                      DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                                      DropdownMenuItem(value: 'Low', child: Text('Low')),
                                    ],
                                    onChanged: (val) {
                                      if (val != null) setState(() => _defectSeverity = val);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text('Assigned to', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<int>(
                          initialValue: _defectAssignedTo,
                          items: [
                            const DropdownMenuItem(value: null, child: Text('Unassigned')),
                            ...teamMembers.map((m) => DropdownMenuItem(value: m.id, child: Text(m.name))),
                          ],
                          onChanged: (val) => setState(() => _defectAssignedTo = val),
                        ),
                        const SizedBox(height: 12),
                        Text('Description', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                        const SizedBox(height: 6),
                        TextFormField(controller: _defectDescController, maxLines: 2),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _addDefect,
                          child: const Text('Add defect'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Bottom Row: Quality checklist + Risk matrix & PDPC responses
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Quality checklist (1/2 width)
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
                                'Quality checklist',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: checklistItems.length,
                                separatorBuilder: (_, __) => const Divider(height: 16, color: CarePlanTheme.cardBorder),
                                itemBuilder: (context, index) {
                                  final item = checklistItems[index];

                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(item.deliverable, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                            const SizedBox(height: 2),
                                            Text(item.criterion, style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                            const SizedBox(height: 2),
                                            Text('Pending QA inspection.', style: TextStyle(fontSize: 10, color: CarePlanTheme.textLight)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 130,
                                        height: 38,
                                        child: DropdownButtonFormField<String>(
                                          initialValue: item.inspectionResult,
                                          items: const [
                                            DropdownMenuItem(value: 'Not inspected', child: Text('Not inspected', style: TextStyle(fontSize: 11))),
                                            DropdownMenuItem(value: 'Pass', child: Text('Pass', style: TextStyle(fontSize: 11))),
                                            DropdownMenuItem(value: 'Fail', child: Text('Fail', style: TextStyle(fontSize: 11))),
                                          ],
                                          onChanged: (val) {
                                            if (val != null) _updateChecklistStatus(item, val);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                              const Divider(height: 1, color: CarePlanTheme.cardBorder),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Deliverable', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                        const SizedBox(height: 6),
                                        TextFormField(controller: _deliverableController),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Check item', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                        const SizedBox(height: 6),
                                        TextFormField(controller: _checkItemController),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text('Notes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              TextFormField(controller: _notesController, maxLines: 2),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: _addChecklistItem,
                                child: const Text('Add checklist item'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Risk matrix & PDPC responses (1/2 width)
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
                                'Risk matrix & PDPC responses',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: risks.length,
                                separatorBuilder: (_, __) => const Divider(height: 20, color: CarePlanTheme.cardBorder),
                                itemBuilder: (context, index) {
                                  final risk = risks[index];
                                  final isHigh = risk.score >= 15;

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              risk.title,
                                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                                            ),
                                          ),
                                          CarePlanBadge(
                                            label: '${risk.status} · ${risk.score}/25',
                                            backgroundColor: isHigh ? CarePlanTheme.statusRedBg : CarePlanTheme.statusOrangeBg,
                                            textColor: isHigh ? CarePlanTheme.statusRedText : CarePlanTheme.statusOrangeText,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        risk.description,
                                        style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted),
                                      ),
                                      const SizedBox(height: 6),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark),
                                          children: [
                                            const TextSpan(text: 'Prevent: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: risk.preventiveAction, style: TextStyle(color: CarePlanTheme.textMuted)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark),
                                          children: [
                                            const TextSpan(text: 'Contingency: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                            TextSpan(text: risk.correctiveAction, style: TextStyle(color: CarePlanTheme.textMuted)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Likelihood ${risk.likelihood}/5 · Impact ${risk.impact}/5',
                                        style: TextStyle(fontSize: 10, color: CarePlanTheme.textLight),
                                      ),
                                    ],
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
}
