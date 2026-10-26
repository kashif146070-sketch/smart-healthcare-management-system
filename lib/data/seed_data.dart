import 'package:drift/drift.dart';
import 'database.dart';

Future<void> seedDatabase(AppDatabase db, {bool forceReset = false}) async {
  if (forceReset) {
    await db.delete(db.projectCharter).go();
    await db.delete(db.stakeholders).go();
    await db.delete(db.requirements).go();
    await db.delete(db.wbsNodes).go();
    await db.delete(db.changeRequests).go();
    await db.delete(db.activities).go();
    await db.delete(db.activityDependencies).go();
    await db.delete(db.teamMembers).go();
    await db.delete(db.activityCosts).go();
    await db.delete(db.evmSnapshots).go();
    await db.delete(db.defects).go();
    await db.delete(db.qualityChecklistItems).go();
    await db.delete(db.risks).go();
    await db.delete(db.auditLog).go();
  } else {
    final existingCharters = await db.select(db.projectCharter).get();
    if (existingCharters.isNotEmpty) {
      return; // Already seeded
    }
  }

  final startDate = DateTime(2026, 10, 26);
  final deadlineDate = DateTime(2027, 3, 7); // 19 weeks from start

  // 1. Insert Project Charter
  await db.into(db.projectCharter).insert(
    ProjectCharterCompanion(
      projectName: const Value('Healthcare application delivery'),
      objectives: const Value('Provide dependable patient appointments, laboratory reports, doctor schedules, online consultations, and hospital billing.'),
      scopeBoundaries: const Value('Deliver a shared healthcare application for a network of five participating hospitals.'),
      approvedBudget: const Value(5800000.0), // PKR 5,800,000
      deadlineDate: Value(deadlineDate),
      status: const Value('Planning'),
      createdAt: Value(startDate),
    ),
  );

  // 2. Insert 7 Team Members
  final pmId = await db.into(db.teamMembers).insert(
    TeamMembersCompanion(name: const Value('Project Manager'), role: const Value('Project Manager'), dailyRate: const Value(15000.0))
  );
  final be1Id = await db.into(db.teamMembers).insert(
    TeamMembersCompanion(name: const Value('Backend Developer 1'), role: const Value('Backend Developer'), dailyRate: const Value(12000.0))
  );
  final be2Id = await db.into(db.teamMembers).insert(
    TeamMembersCompanion(name: const Value('Backend Developer 2'), role: const Value('Backend Developer'), dailyRate: const Value(12000.0))
  );
  final fe1Id = await db.into(db.teamMembers).insert(
    TeamMembersCompanion(name: const Value('Frontend Developer 1'), role: const Value('Frontend Developer'), dailyRate: const Value(10000.0))
  );
  final fe2Id = await db.into(db.teamMembers).insert(
    TeamMembersCompanion(name: const Value('Frontend Developer 2'), role: const Value('Frontend Developer'), dailyRate: const Value(10000.0))
  );
  final dbDevId = await db.into(db.teamMembers).insert(
    TeamMembersCompanion(name: const Value('Database Developer'), role: const Value('Database Developer'), dailyRate: const Value(13000.0))
  );
  final qaId = await db.into(db.teamMembers).insert(
    TeamMembersCompanion(name: const Value('QA Engineer'), role: const Value('QA Engineer'), dailyRate: const Value(9000.0))
  );

  // 3. Insert Requirements
  final req1 = await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('Patient appointments'),
    description: const Value('Manage patient appointment booking and scheduling.'),
    priority: const Value('Critical'),
    status: const Value('approved'),
    isInScope: const Value(true),
    createdAt: Value(startDate),
  ));

  final req2 = await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('Laboratory reports'),
    description: const Value('Provide access to laboratory reports.'),
    priority: const Value('High'),
    status: const Value('approved'),
    isInScope: const Value(true),
    createdAt: Value(startDate),
  ));

  final req3 = await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('Doctor schedules'),
    description: const Value('Maintain doctor schedules for participating hospitals.'),
    priority: const Value('High'),
    status: const Value('approved'),
    isInScope: const Value(true),
    createdAt: Value(startDate),
  ));

  final req4 = await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('Online consultations'),
    description: const Value('Support online consultations between patients and doctors.'),
    priority: const Value('High'),
    status: const Value('approved'),
    isInScope: const Value(true),
    createdAt: Value(startDate),
  ));

  final req5 = await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('Hospital billing'),
    description: const Value('Manage hospital billing records.'),
    priority: const Value('High'),
    status: const Value('approved'),
    isInScope: const Value(true),
    createdAt: Value(startDate),
  ));

  final req6 = await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('AI-based preliminary diagnosis module'),
    description: const Value('Proposed AI-based preliminary diagnosis capability; excluded from the approved baseline until approved.'),
    priority: const Value('Medium'),
    status: const Value('approved'),
    isInScope: const Value(true),
    createdAt: Value(startDate),
  ));

  final req7 = await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('Mobile application'),
    description: const Value('Proposed mobile application; excluded from the approved baseline until approved.'),
    priority: const Value('Medium'),
    status: const Value('approved'),
    isInScope: const Value(true),
    createdAt: Value(startDate),
  ));

  await db.into(db.requirements).insert(RequirementsCompanion(
    title: const Value('online payment'),
    description: const Value('very important'),
    priority: const Value('Medium'),
    status: const Value('draft'),
    isInScope: const Value(false),
    createdAt: Value(startDate),
  ));

  // 4. Insert Change Request
  await db.into(db.changeRequests).insert(ChangeRequestsCompanion(
    title: const Value('AI diagnosis and mobile application'),
    justification: const Value('Assess and approve the two proposed capabilities as a combined scope change. Includes: AI-based preliminary diagnosis module, Mobile application'),
    costImpact: const Value(800000.0),
    scheduleImpactDays: const Value(21), // +3 weeks
    status: const Value('approved'),
    submittedAt: Value(startDate),
    affects: const Value('Scope, Budget, Schedule'),
  ));

  // 5. Insert WBS Nodes
  final wbsMain = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    title: const Value('Healthcare application delivery'),
    level: const Value(1),
    deliverableType: const Value('deliverable'),
  ));

  final wbs1_1 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Initiation and requirements'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req1),
  ));
  final wbs1_2 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Solution design and data foundation'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req2),
  ));
  final wbs1_3 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Patient appointments'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req1),
  ));
  final wbs1_4 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Laboratory reports and doctor schedules'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req3),
  ));
  final wbs1_5 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Online consultations and hospital billing'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req4),
  ));
  final wbs1_6 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Integration and system testing'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req5),
  ));
  final wbs1_7 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('User acceptance and defect resolution'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req5),
  ));
  final wbs1_8 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Release readiness and closure'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req5),
  ));
  final wbs1_9 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('AI-based preliminary diagnosis module'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req6),
  ));
  final wbs1_10 = await db.into(db.wbsNodes).insert(WbsNodesCompanion(
    parentId: Value(wbsMain), title: const Value('Mobile application'), level: const Value(1), deliverableType: const Value('work_package'), linkedRequirementId: Value(req7),
  ));

  // 6. Insert Activities
  final act1 = await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_1),
    name: const Value('Initiation and requirements'),
    assignedTo: Value(pmId),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2026, 10, 26)),
    plannedEnd: Value(DateTime(2026, 11, 8)),
    status: const Value('complete'),
    percentComplete: const Value(100.0),
  ));

  final act2 = await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_2),
    name: const Value('Solution design and data foundation'),
    assignedTo: Value(dbDevId),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2026, 11, 9)),
    plannedEnd: Value(DateTime(2026, 11, 22)),
    status: const Value('complete'),
    percentComplete: const Value(100.0),
  ));

  final act3 = await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_3),
    name: const Value('Patient appointments'),
    assignedTo: Value(be1Id),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2026, 11, 23)),
    plannedEnd: Value(DateTime(2026, 12, 6)),
    status: const Value('in_progress'),
    percentComplete: const Value(65.0),
  ));

  final act4 = await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_4),
    name: const Value('Laboratory reports and doctor schedules'),
    assignedTo: Value(be2Id),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2026, 12, 7)),
    plannedEnd: Value(DateTime(2026, 12, 20)),
    status: const Value('in_progress'),
    percentComplete: const Value(35.0),
  ));

  final act5 = await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_5),
    name: const Value('Online consultations and hospital billing'),
    assignedTo: Value(fe1Id),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2026, 12, 21)),
    plannedEnd: Value(DateTime(2027, 1, 3)),
    status: const Value('in_progress'),
    percentComplete: const Value(25.0),
  ));

  await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_6),
    name: const Value('Integration and system testing'),
    assignedTo: Value(qaId),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2027, 1, 4)),
    plannedEnd: Value(DateTime(2027, 1, 17)),
    status: const Value('not_started'),
    percentComplete: const Value(0.0),
  ));

  await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_7),
    name: const Value('User acceptance and defect resolution'),
    assignedTo: Value(qaId),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2027, 1, 18)),
    plannedEnd: Value(DateTime(2027, 1, 31)),
    status: const Value('not_started'),
    percentComplete: const Value(0.0),
  ));

  await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_8),
    name: const Value('Release readiness and closure'),
    assignedTo: Value(pmId),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2027, 2, 1)),
    plannedEnd: Value(DateTime(2027, 2, 14)),
    status: const Value('not_started'),
    percentComplete: const Value(0.0),
  ));

  await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_9),
    name: const Value('AI-based preliminary diagnosis module'),
    assignedTo: Value(be1Id),
    estimatedDurationDays: const Value(11),
    plannedStart: Value(DateTime(2027, 2, 15)),
    plannedEnd: Value(DateTime(2027, 2, 25)),
    status: const Value('not_started'),
    percentComplete: const Value(0.0),
  ));

  await db.into(db.activities).insert(ActivitiesCompanion(
    wbsNodeId: Value(wbs1_10),
    name: const Value('Mobile application'),
    assignedTo: Value(fe2Id),
    estimatedDurationDays: const Value(14),
    plannedStart: Value(DateTime(2027, 2, 26)),
    plannedEnd: Value(DateTime(2027, 3, 7)),
    status: const Value('not_started'),
    percentComplete: const Value(0.0),
  ));

  // Dependencies
  await db.into(db.activityDependencies).insert(ActivityDependenciesCompanion(
    predecessorId: Value(act1), successorId: Value(act2), dependencyType: const Value('finish_to_start'),
  ));
  await db.into(db.activityDependencies).insert(ActivityDependenciesCompanion(
    predecessorId: Value(act2), successorId: Value(act3), dependencyType: const Value('finish_to_start'),
  ));
  await db.into(db.activityDependencies).insert(ActivityDependenciesCompanion(
    predecessorId: Value(act3), successorId: Value(act4), dependencyType: const Value('finish_to_start'),
  ));
  await db.into(db.activityDependencies).insert(ActivityDependenciesCompanion(
    predecessorId: Value(act4), successorId: Value(act5), dependencyType: const Value('finish_to_start'),
  ));

  // 7. Insert Defects
  await db.into(db.defects).insert(DefectsCompanion(
    activityId: Value(act3),
    moduleName: const Value('Appointment scheduling'),
    description: const Value('Critical defect: appointment scheduling requires investigation and resolution.'),
    severity: const Value('Critical'),
    assignedTo: Value(be1Id),
    status: const Value('Open'),
    reportedAt: Value(startDate),
  ));

  await db.into(db.defects).insert(DefectsCompanion(
    activityId: Value(act4),
    moduleName: const Value('Patient record management'),
    description: const Value('Critical defect: patient record management requires investigation and resolution.'),
    severity: const Value('Critical'),
    assignedTo: Value(be2Id),
    status: const Value('Open'),
    reportedAt: Value(startDate),
  ));

  // 8. Insert Quality Checklist
  await db.into(db.qualityChecklistItems).insert(QualityChecklistItemsCompanion(
    deliverable: const Value('Patient appointments'),
    criterion: const Value('Appointment booking and schedule conflicts are tested.'),
    inspectionResult: const Value('Not inspected'),
  ));
  await db.into(db.qualityChecklistItems).insert(QualityChecklistItemsCompanion(
    deliverable: const Value('Laboratory reports'),
    criterion: const Value('Laboratory report access is verified.'),
    inspectionResult: const Value('Not inspected'),
  ));
  await db.into(db.qualityChecklistItems).insert(QualityChecklistItemsCompanion(
    deliverable: const Value('Doctor schedules'),
    criterion: const Value('Doctor schedule updates are verified.'),
    inspectionResult: const Value('Not inspected'),
  ));
  await db.into(db.qualityChecklistItems).insert(QualityChecklistItemsCompanion(
    deliverable: const Value('Online consultations'),
    criterion: const Value('Consultation workflow is tested.'),
    inspectionResult: const Value('Not inspected'),
  ));
  await db.into(db.qualityChecklistItems).insert(QualityChecklistItemsCompanion(
    deliverable: const Value('Hospital billing'),
    criterion: const Value('Billing record calculations are tested.'),
    inspectionResult: const Value('Not inspected'),
  ));

  // 9. Insert Risks
  await db.into(db.risks).insert(RisksCompanion(
    title: const Value('Critical appointment defect remains unresolved'),
    description: const Value('Appointment scheduling defect may delay acceptance.'),
    likelihood: const Value(4),
    impact: const Value(5),
    score: const Value(20),
    responseType: const Value('Avoid'),
    preventiveAction: const Value('Prioritize QA reproduction and developer fixes.'),
    correctiveAction: const Value('Re-plan dependent verification and obtain hospital acceptance after retest.'),
    status: const Value('High'),
  ));

  await db.into(db.risks).insert(RisksCompanion(
    title: const Value('Patient record defect remains unresolved'),
    description: const Value('Patient record management defect may compromise deliverable quality.'),
    likelihood: const Value(3),
    impact: const Value(5),
    score: const Value(15),
    responseType: const Value('Mitigate'),
    preventiveAction: const Value('Assign a backend developer and verify corrected record workflows.'),
    correctiveAction: const Value('Hold release readiness until regression checks pass.'),
    status: const Value('High'),
  ));

  await db.into(db.risks).insert(RisksCompanion(
    title: const Value('Proposed change affects baseline'),
    description: const Value('AI and mobile proposals may increase cost and duration if approved.'),
    likelihood: const Value(3),
    impact: const Value(4),
    score: const Value(12),
    responseType: const Value('Accept'),
    preventiveAction: const Value('Use formal change control and retain the approved baseline while pending.'),
    correctiveAction: const Value('Rebaseline only through a single approved transaction.'),
    status: const Value('Medium'),
  ));

  // 10. Insert Expenditure Ledger
  await db.into(db.activityCosts).insert(ActivityCostsCompanion(
    activityId: Value(act1), plannedCost: const Value(350000.0), actualCost: const Value(350000.0), recordedAt: Value(startDate),
  ));
  await db.into(db.activityCosts).insert(ActivityCostsCompanion(
    activityId: Value(act2), plannedCost: const Value(320000.0), actualCost: const Value(320000.0), recordedAt: Value(startDate),
  ));
  await db.into(db.activityCosts).insert(ActivityCostsCompanion(
    activityId: Value(act3), plannedCost: const Value(410000.0), actualCost: const Value(410000.0), recordedAt: Value(startDate),
  ));
  await db.into(db.activityCosts).insert(ActivityCostsCompanion(
    activityId: Value(act4), plannedCost: const Value(180000.0), actualCost: const Value(180000.0), recordedAt: Value(startDate),
  ));

  // 11. Initial EVM Snapshot
  await db.into(db.evmSnapshots).insert(EvmSnapshotsCompanion(
    snapshotDate: Value(startDate),
    pv: const Value(0.0),
    ev: const Value(1470000.0),
    ac: const Value(1425000.0),
    cpi: const Value(1.03),
    spi: const Value(1.0),
    note: const Value('Baseline Snapshot'),
  ));
}
