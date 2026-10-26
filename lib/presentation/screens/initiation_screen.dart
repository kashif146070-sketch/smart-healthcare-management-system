import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers.dart';
import '../../theme/app_theme.dart';
import '../widgets/page_header.dart';
import '../../data/database.dart';

class InitiationScreen extends ConsumerStatefulWidget {
  const InitiationScreen({super.key});

  @override
  ConsumerState<InitiationScreen> createState() => _InitiationScreenState();
}

class _InitiationScreenState extends ConsumerState<InitiationScreen> {
  ProjectCharterData? charter;
  List<TeamMember> teamMembers = [];
  bool isLoading = true;

  late TextEditingController _startDateController;
  late TextEditingController _closureNotesController;
  String _selectedStatus = 'Planning';

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _closureNotesController = TextEditingController();
    _loadData();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _closureNotesController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final c = await (db.select(db.projectCharter)..limit(1)).getSingleOrNull();
    final members = await db.select(db.teamMembers).get();

    if (mounted) {
      setState(() {
        charter = c;
        teamMembers = members;
        if (c != null) {
          _startDateController.text = DateFormat('dd/MM/yyyy').format(c.createdAt);
          _selectedStatus = c.status;
        }
        isLoading = false;
      });
    }
  }

  Future<void> _saveProjectDetails() async {
    final db = ref.read(dbProvider);
    if (charter != null) {
      DateTime parsedDate;
      try {
        final parts = _startDateController.text.split('/');
        if (parts.length == 3) {
          parsedDate = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
        } else {
          parsedDate = charter!.createdAt;
        }
      } catch (_) {
        parsedDate = charter!.createdAt;
      }

      await db.update(db.projectCharter).replace(
        charter!.copyWith(
          createdAt: parsedDate,
          status: _selectedStatus,
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Project details saved successfully!')),
        );
        _loadData();
      }
    }
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
              breadcrumbModule: 'Initiation',
              moduleTag: 'Module 1',
              title: 'Project initiation & integration',
              subtitle: 'Project charter, baseline, management plan, stakeholders and responsibilities.',
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  // Top Row: Project charter + Project management plan
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project charter
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
                                'Project charter',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Five-Hospital Healthcare Application',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Deliver a shared healthcare application for a network of five participating hospitals.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: CarePlanTheme.textMuted,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Objectives',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Provide dependable patient appointments, laboratory reports, doctor schedules, online consultations, and hospital billing.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: CarePlanTheme.textMuted,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Included scope',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: CarePlanTheme.textDark,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Patient appointments; laboratory reports; doctor schedules; online consultations; hospital billing. Approved change: AI-based preliminary diagnosis module; Mobile application',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: CarePlanTheme.textMuted,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Scope boundaries',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: CarePlanTheme.textDark,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'No additional proposed changes approved.',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: CarePlanTheme.textMuted,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 28, color: CarePlanTheme.cardBorder),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Approved budget', style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                      const SizedBox(height: 2),
                                      Text(
                                        'PKR ${(charter?.approvedBudget ?? 5800000).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Duration', style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                      const SizedBox(height: 2),
                                      Text('19 weeks', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Project management plan
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
                                'Project management plan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildPlanSection(
                                'Scope',
                                'Approved scope includes the original healthcare requirements plus AI-based preliminary diagnosis module; Mobile application.',
                              ),
                              const Divider(height: 20, color: CarePlanTheme.cardBorder),
                              _buildPlanSection(
                                'Schedule',
                                '19-week approved baseline. Configure the project start date to calculate activity dates and the final deadline.',
                              ),
                              const Divider(height: 20, color: CarePlanTheme.cardBorder),
                              _buildPlanSection(
                                'Cost',
                                'Approved baseline PKR 5,800,000; activity estimates and actual expenditure are tracked for EVM.',
                              ),
                              const Divider(height: 20, color: CarePlanTheme.cardBorder),
                              _buildPlanSection(
                                'Quality',
                                'Use deliverable checklists, defect triage, and risk responses; critical defects require resolution before closure.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Middle Row: Project status & configurable start date + Milestones & responsibilities
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project status & configurable start date
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
                                'Project status & configurable start date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Project start date', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                        const SizedBox(height: 6),
                                        TextFormField(
                                          controller: _startDateController,
                                          decoration: const InputDecoration(
                                            suffixIcon: Icon(Icons.calendar_today_outlined, size: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Project status', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                                        const SizedBox(height: 6),
                                        DropdownButtonFormField<String>(
                                          initialValue: _selectedStatus,
                                          items: const [
                                            DropdownMenuItem(value: 'Initiating', child: Text('Initiating')),
                                            DropdownMenuItem(value: 'Planning', child: Text('Planning')),
                                            DropdownMenuItem(value: 'Executing', child: Text('Executing')),
                                            DropdownMenuItem(value: 'Closed', child: Text('Closed')),
                                          ],
                                          onChanged: (val) {
                                            if (val != null) setState(() => _selectedStatus = val);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text('Closure record / notes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              TextFormField(
                                controller: _closureNotesController,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  hintText: 'sss',
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _saveProjectDetails,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: CarePlanTheme.primaryTeal,
                                ),
                                child: const Text('Save project details'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                      // Milestones & responsibilities
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
                                'Milestones & responsibilities',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CarePlanTheme.textDark,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                color: const Color(0xFFF8FAFC),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(child: Text('TEAM MEMBER', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(child: Text('ROLE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: teamMembers.length,
                                separatorBuilder: (_, __) => const Divider(height: 1, color: CarePlanTheme.cardBorder),
                                itemBuilder: (context, index) {
                                  final member = teamMembers[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text(member.name, style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(child: Text(member.role, style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted))),
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

                  // Bottom Section: Participating hospitals
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
                          'Participating hospitals',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: CarePlanTheme.textDark,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildHospitalCard('Central City Hospital'),
                            const SizedBox(width: 16),
                            _buildHospitalCard('North General Hospital'),
                            const SizedBox(width: 16),
                            _buildHospitalCard('East Medical Centre'),
                            const SizedBox(width: 16),
                            _buildHospitalCard('Westside Hospital'),
                            const SizedBox(width: 16),
                            _buildHospitalCard('South Community Hospital'),
                          ],
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

  Widget _buildPlanSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted),
        ),
      ],
    );
  }

  Widget _buildHospitalCard(String name) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: CarePlanTheme.cardBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: CarePlanTheme.primaryTealLight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.add, color: CarePlanTheme.primaryTeal, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Participating hospital',
                    style: TextStyle(fontSize: 10, color: CarePlanTheme.textMuted),
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
