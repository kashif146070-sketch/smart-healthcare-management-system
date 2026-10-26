import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers.dart';
import '../../theme/app_theme.dart';
import '../widgets/page_header.dart';
import '../../data/database.dart';
import '../../domain/services.dart';

class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  List<Activity> activities = [];
  List<ActivityDependency> dependencies = [];
  List<TeamMember> teamMembers = [];
  bool isLoading = true;

  int? _selectedActivityId;
  int? _selectedPredecessorId;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final db = ref.read(dbProvider);
    final acts = await db.select(db.activities).get();
    final deps = await db.select(db.activityDependencies).get();
    final members = await db.select(db.teamMembers).get();

    if (mounted) {
      setState(() {
        activities = acts;
        dependencies = deps;
        teamMembers = members;
        if (acts.isNotEmpty) {
          _selectedActivityId ??= acts.first.id;
          _selectedPredecessorId ??= acts.first.id;
        }
        isLoading = false;
      });
    }
  }

  Future<void> _addDependency() async {
    if (_selectedActivityId == null || _selectedPredecessorId == null) return;
    if (_selectedActivityId == _selectedPredecessorId) return;

    final db = ref.read(dbProvider);
    await db.into(db.activityDependencies).insert(
      ActivityDependenciesCompanion.insert(
        predecessorId: _selectedPredecessorId!,
        successorId: _selectedActivityId!,
        dependencyType: 'finish_to_start',
      ),
    );

    await ref.read(schedulingServiceProvider).computeSchedule();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final delayedCount = activities.where((a) => a.status.toLowerCase() == 'delayed').length;

    return Scaffold(
      backgroundColor: CarePlanTheme.pageBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarePlanPageHeader(
              breadcrumbModule: 'Schedule',
              moduleTag: 'Module 3',
              title: 'Schedule & resource management',
              subtitle: 'Forward-planned activity dates, predecessor links, assignments, progress and forecast impacts.',
              action: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: CarePlanTheme.cardBorder),
                ),
                child: Text('On track', style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  // Top 3 Metric Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard(
                          'Baseline deadline',
                          '2027-03-07',
                          'Set a start date in Initiation',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Forecast deadline',
                          '2027-03-07',
                          '',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _buildMetricCard(
                          'Delayed activities',
                          '$delayedCount',
                          'Includes downstream forecast impact',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Middle Section: Activity timeline
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
                          'Activity timeline',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                        ),
                        const SizedBox(height: 20),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: activities.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final act = activities[index];
                            final pct = act.percentComplete.toInt();
                            Widget badge;
                            if (act.status.toLowerCase() == 'complete') {
                              badge = CarePlanBadge.complete();
                            } else if (act.status.toLowerCase() == 'in_progress') {
                              badge = CarePlanBadge.inProgress();
                            } else {
                              badge = CarePlanBadge.pending('Not started');
                            }

                            return Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('1.${index + 1} ${act.name}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                      const SizedBox(height: 2),
                                      Text('${act.estimatedDurationDays} days · ${DateFormat('yyyy-MM-dd').format(act.plannedStart)}', style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  flex: 4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: LinearProgressIndicator(
                                      value: act.percentComplete / 100.0,
                                      minHeight: 18,
                                      backgroundColor: const Color(0xFFE2E8F0),
                                      color: act.status.toLowerCase() == 'delayed' ? CarePlanTheme.statusRedText : CarePlanTheme.primaryTeal,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                SizedBox(
                                  width: 40,
                                  child: Text('$pct%', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark)),
                                ),
                                const SizedBox(width: 12),
                                badge,
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Bottom Section: Activity progress, resources & dependencies + Add dependency
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Table (2/3 width)
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
                                'Activity progress, resources & dependencies',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                color: const Color(0xFFF8FAFC),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(flex: 3, child: Text('ACTIVITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 1, child: Text('PREDECESSORS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 2, child: Text('PROGRESS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                    Expanded(flex: 2, child: Text('FORECAST', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: CarePlanTheme.textMuted))),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: activities.length,
                                separatorBuilder: (_, __) => const Divider(height: 1, color: CarePlanTheme.cardBorder),
                                itemBuilder: (context, index) {
                                  final act = activities[index];
                                  final pred = dependencies.where((d) => d.successorId == act.id).map((d) => d.predecessorId.toString()).join(', ');

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    child: Row(
                                      children: [
                                        Expanded(flex: 3, child: Text(act.name, style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
                                        Expanded(flex: 1, child: Text(pred.isEmpty ? '—' : pred, style: TextStyle(fontSize: 12, color: CarePlanTheme.textMuted))),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(4),
                                                  child: LinearProgressIndicator(
                                                    value: act.percentComplete / 100.0,
                                                    minHeight: 8,
                                                    backgroundColor: const Color(0xFFE2E8F0),
                                                    color: CarePlanTheme.primaryTeal,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text('${act.percentComplete.toInt()}%', style: TextStyle(fontSize: 11, color: CarePlanTheme.textMuted)),
                                            ],
                                          ),
                                        ),
                                        Expanded(flex: 2, child: Text(DateFormat('yyyy-MM-dd').format(act.plannedEnd), style: TextStyle(fontSize: 12, color: CarePlanTheme.textDark))),
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

                      // Add dependency (1/3 width)
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
                                'Add dependency',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CarePlanTheme.textDark),
                              ),
                              const SizedBox(height: 16),
                              Text('Activity', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<int>(
                                initialValue: _selectedActivityId,
                                items: activities.map((a) => DropdownMenuItem(value: a.id, child: Text(a.name, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: (val) {
                                  if (val != null) setState(() => _selectedActivityId = val);
                                },
                              ),
                              const SizedBox(height: 16),
                              Text('Depends on', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CarePlanTheme.textDark)),
                              const SizedBox(height: 6),
                              DropdownButtonFormField<int>(
                                initialValue: _selectedPredecessorId,
                                items: activities.map((a) => DropdownMenuItem(value: a.id, child: Text(a.name, overflow: TextOverflow.ellipsis))).toList(),
                                onChanged: (val) {
                                  if (val != null) setState(() => _selectedPredecessorId = val);
                                },
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _addDependency,
                                child: const Text('Add predecessor'),
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
}
