import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers.dart';
import '../../theme/app_theme.dart';
import '../widgets/page_header.dart';
import '../../data/database.dart';
import '../../domain/services.dart';

class ScopeScreen extends ConsumerStatefulWidget {
  const ScopeScreen({super.key});

  @override
  ConsumerState<ScopeScreen> createState() => _ScopeScreenState();
}

class _ScopeScreenState extends ConsumerState<ScopeScreen> {
  List<Requirement> requirements = [];
  List<WbsNode> wbsNodes = [];
  List<ChangeRequest> changeRequests = [];
  bool isLoading = true;

  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String _selectedPriority = 'Medium';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final reqs = await db.select(db.requirements).get();
    final nodes = await db.select(db.wbsNodes).get();
    final crs = await db.select(db.changeRequests).get();

    if (mounted) {
      setState(() {
        requirements = reqs;
        wbsNodes = nodes;
        changeRequests = crs;
        isLoading = false;
      });
    }
  }

  Future<void> _addRequirement() async {
    if (_titleController.text.trim().isEmpty) return;

    final db = ref.read(dbProvider);
    await db.into(db.requirements).insert(
      RequirementsCompanion.insert(
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        priority: _selectedPriority,
        status: 'draft',
        isInScope: false,
        createdAt: DateTime.now(),
      ),
    );

    _titleController.clear();
    _descController.clear();
    _loadData();
  }

  Future<void> _approveRequirement(Requirement req) async {
    final db = ref.read(dbProvider);
    await db.update(db.requirements).replace(
      req.copyWith(
        status: 'approved',
        isInScope: true,
      ),
    );
    _loadData();
  }

  Future<void> _approveChangeRequest(ChangeRequest cr) async {
    await ref.read(changeControlServiceProvider).approveChangeRequest(cr.id);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final firstCr = changeRequests.isNotEmpty ? changeRequests.first : null;

    return Scaffold(
      backgroundColor: CarePlanTheme.pageBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarePlanPageHeader(
              breadcrumbModule: 'Scope & WBS',
              moduleTag: 'Module 2',
              title: 'Scope management & WBS',
              subtitle: 'Proposals remain outside the approved scope until a change request is approved.',
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  // Change control card
                  if (firstCr != null)
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Change control',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              if (firstCr.status == 'approved')
                                CarePlanBadge.approved()
                              else
                                ElevatedButton(
                                  onPressed: () => _approveChangeRequest(firstCr),
                                  child: const Text('Approve change request'),
                                ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'CHANGE REQUEST #${firstCr.id}'.toUpperCase(),
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted, letterSpacing: 1.1),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            firstCr.title,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            firstCr.justification,
                            style: TextStyle(fontSize: 13, color: CarePlanTheme.textMuted),
                          ),
                          const Divider(height: 24, color: CarePlanTheme.cardBorder),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Cost impact', style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                  const SizedBox(height: 2),
                                  Text('PKR ${firstCr.costImpact.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                ],
                              ),
                              const SizedBox(width: 40),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Schedule impact', style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                  const SizedBox(height: 2),
                                  Text('+${firstCr.scheduleImpactDays ~/ 7} weeks', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Applied once to the project baseline.',
                            style: TextStyle(fontSize: 11, color: CarePlanTheme.primaryTeal),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),

                  // Middle Row: Requirements register + Add requirement
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Requirements register (2/3 width)
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
                                'Requirements register',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                color: const Color(0xFFF8FAFC),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(flex: 3, child: Text('REQUIREMENT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 1, child: Text('PRIORITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 2, child: Text('STATUS / SCOPE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
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
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(req.title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                              if (req.description.isNotEmpty)
                                                Text(req.description, style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: const Color(0xFFCBD5E1)),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(req.priority, style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              if (isApproved)
                                                CarePlanBadge.approved()
                                              else
                                                Row(
                                                  children: [
                                                    CarePlanBadge.proposed(),
                                                    const SizedBox(width: 8),
                                                    InkWell(
                                                      onTap: () => _approveRequirement(req),
                                                      child: Text(
                                                        'Approve requirement',
                                                        style: TextStyle(fontSize: 11, color: CarePlanTheme.primaryTeal, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                      ),
                      const SizedBox(width: 24),

                      // Add requirement (1/3 width)
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
                                'Add requirement',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Title', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                        const SizedBox(height: 6),
                                        TextFormField(controller: _titleController),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text('Category', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              TextFormField(
                                initialValue: 'Project requirement',
                                readOnly: true,
                              ),
                              const SizedBox(height: 12),
                              Text('Priority', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<String>(
                                initialValue: _selectedPriority,
                                items: const [
                                  DropdownMenuItem(value: 'Critical', child: Text('Critical')),
                                  DropdownMenuItem(value: 'High', child: Text('High')),
                                  DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                                  DropdownMenuItem(value: 'Low', child: Text('Low')),
                                ],
                                onChanged: (val) {
                                  if (val != null) setState(() => _selectedPriority = val);
                                },
                              ),
                              const SizedBox(height: 12),
                              Text('Description', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              TextFormField(controller: _descController, maxLines: 3),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _addRequirement,
                                child: const Text('Add as proposed'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Bottom Section: Hierarchical Work Breakdown Structure
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
                          'Hierarchical Work Breakdown Structure',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: wbsNodes.length,
                          separatorBuilder: (_, __) => const Divider(height: 1, color: CarePlanTheme.cardBorder),
                          itemBuilder: (context, index) {
                            final node = wbsNodes[index];
                            final isDeliverable = node.deliverableType == 'deliverable';
                            final code = isDeliverable ? '1' : '1.$index';

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: Text(
                                      code,
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: CarePlanTheme.primaryTeal),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      node.title,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: isDeliverable ? FontWeight.bold : FontWeight.normal,
                                        color: CarePlanTheme.textDark,
                                      ),
                                    ),
                                  ),
                                  isDeliverable ? CarePlanBadge.deliverable() : CarePlanBadge.workPackage(),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Activities are linked to work packages in the Schedule module.',
                          style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted),
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
}
