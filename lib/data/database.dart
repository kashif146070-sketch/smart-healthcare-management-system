import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

class ProjectCharter extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get projectName => text()();
  TextColumn get objectives => text()();
  TextColumn get scopeBoundaries => text()();
  RealColumn get approvedBudget => real()();
  DateTimeColumn get deadlineDate => dateTime()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
}

class Stakeholders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get role => text()();
  TextColumn get contact => text()();
  TextColumn get influenceLevel => text()();
}

class Requirements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get priority => text()();
  TextColumn get status => text()(); // draft/approved/rejected
  BoolColumn get isInScope => boolean()();
  DateTimeColumn get createdAt => dateTime()();
}

class WbsNodes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().nullable()();
  TextColumn get title => text()();
  IntColumn get level => integer()();
  TextColumn get deliverableType => text()(); // deliverable/work_package
  IntColumn get linkedRequirementId => integer().nullable()();
}

class ChangeRequests extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get justification => text()();
  RealColumn get costImpact => real()();
  IntColumn get scheduleImpactDays => integer()();
  TextColumn get status => text()(); // pending/approved/rejected
  DateTimeColumn get submittedAt => dateTime()();
  DateTimeColumn get decidedAt => dateTime().nullable()();
  TextColumn get affects => text()();
}

class Activities extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get wbsNodeId => integer()();
  TextColumn get name => text()();
  IntColumn get assignedTo => integer().nullable()();
  IntColumn get estimatedDurationDays => integer()();
  DateTimeColumn get plannedStart => dateTime()();
  DateTimeColumn get plannedEnd => dateTime()();
  DateTimeColumn get actualStart => dateTime().nullable()();
  DateTimeColumn get actualEnd => dateTime().nullable()();
  TextColumn get status => text()(); // not_started/in_progress/delayed/complete
  RealColumn get percentComplete => real()();
}

class ActivityDependencies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get predecessorId => integer()();
  IntColumn get successorId => integer()();
  TextColumn get dependencyType => text()(); // finish_to_start
}

class TeamMembers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get role => text()();
  RealColumn get dailyRate => real()();
}

class ActivityCosts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get activityId => integer()();
  RealColumn get plannedCost => real()();
  RealColumn get actualCost => real()();
  DateTimeColumn get recordedAt => dateTime()();
}

class EvmSnapshots extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get snapshotDate => dateTime()();
  RealColumn get pv => real()();
  RealColumn get ev => real()();
  RealColumn get ac => real()();
  RealColumn get cpi => real()();
  RealColumn get spi => real()();
  TextColumn get note => text().nullable()();
}

class Defects extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get activityId => integer().nullable()();
  TextColumn get moduleName => text().nullable()();
  TextColumn get description => text()();
  TextColumn get severity => text()();
  IntColumn get assignedTo => integer().nullable()();
  TextColumn get status => text()();
  DateTimeColumn get reportedAt => dateTime()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();
}

class QualityChecklistItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get deliverable => text()();
  TextColumn get criterion => text()();
  TextColumn get inspectionResult => text()(); // pass/fail/pending
  IntColumn get testedBy => integer().nullable()();
  DateTimeColumn get testedAt => dateTime().nullable()();
}

class Risks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get likelihood => integer()();
  IntColumn get impact => integer()();
  IntColumn get score => integer()();
  TextColumn get responseType => text()();
  TextColumn get preventiveAction => text()();
  TextColumn get correctiveAction => text()();
  TextColumn get status => text()();
}

class AuditLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entity => text()();
  IntColumn get entityId => integer()();
  TextColumn get action => text()();
  DateTimeColumn get timestamp => dateTime()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [
  ProjectCharter,
  Stakeholders,
  Requirements,
  WbsNodes,
  ChangeRequests,
  Activities,
  ActivityDependencies,
  TeamMembers,
  ActivityCosts,
  EvmSnapshots,
  Defects,
  QualityChecklistItems,
  Risks,
  AuditLog,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}