import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../data/database.dart';

class SchedulingService {
  final AppDatabase db;

  SchedulingService(this.db);

  Future<void> computeSchedule() async {
    final activities = await db.select(db.activities).get();
    final dependencies = await db.select(db.activityDependencies).get();

    final charter = await (db.select(db.projectCharter)..limit(1)).getSingleOrNull();
    final projectStart = charter?.createdAt ?? DateTime.now();

    final activitiesMap = {for (var a in activities) a.id: a};

    final successors = <int, List<ActivityDependency>>{};
    for (var dep in dependencies) {
      successors.putIfAbsent(dep.predecessorId, () => []).add(dep);
    }

    final inDegree = <int, int>{};
    for (var a in activities) {
      inDegree[a.id] = 0;
    }
    for (var dep in dependencies) {
      inDegree[dep.successorId] = (inDegree[dep.successorId] ?? 0) + 1;
    }

    final queue = <int>[];
    for (var id in inDegree.keys) {
      if (inDegree[id] == 0) {
        queue.add(id);
      }
    }

    final sortedIds = <int>[];
    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      sortedIds.add(current);

      final succs = successors[current] ?? [];
      for (var dep in succs) {
        inDegree[dep.successorId] = (inDegree[dep.successorId] ?? 0) - 1;
        if (inDegree[dep.successorId] == 0) {
          queue.add(dep.successorId);
        }
      }
    }

    final startTimes = <int, DateTime>{};

    for (var id in sortedIds) {
      final activity = activitiesMap[id]!;
      DateTime earliestStart = projectStart;

      final preds = dependencies.where((d) => d.successorId == id).toList();
      for (var p in preds) {
        final predActivity = activitiesMap[p.predecessorId]!;
        final predStartTime = startTimes[p.predecessorId] ?? projectStart;
        final predEndTime = predStartTime.add(Duration(days: predActivity.estimatedDurationDays));
        if (predEndTime.isAfter(earliestStart)) {
          earliestStart = predEndTime;
        }
      }

      startTimes[id] = earliestStart;
      final plannedEnd = earliestStart.add(Duration(days: activity.estimatedDurationDays));

      await db.update(db.activities).replace(
        activity.copyWith(
          plannedStart: earliestStart,
          plannedEnd: plannedEnd,
        ),
      );
    }
  }

  Future<void> detectAndHandleDelays() async {
    final activities = await db.select(db.activities).get();
    final today = DateTime.now();
    bool delayedAny = false;

    for (var activity in activities) {
      bool isDelayed = false;

      if (today.isAfter(activity.plannedEnd) && activity.percentComplete < 100) {
        isDelayed = true;
      } else if (activity.actualEnd != null && activity.actualEnd!.isAfter(activity.plannedEnd)) {
        isDelayed = true;
      }

      if (isDelayed && activity.status != 'delayed') {
        await db.update(db.activities).replace(
          activity.copyWith(status: 'delayed'),
        );
        delayedAny = true;
      }
    }

    if (delayedAny) {
      await computeSchedule();
    }
  }
}

class EvmService {
  final AppDatabase db;

  EvmService(this.db);

  Future<void> captureSnapshot(DateTime statusDate) async {
    final activities = await db.select(db.activities).get();
    final costs = await db.select(db.activityCosts).get();

    double pv = 0.0;
    double ev = 0.0;
    double ac = 0.0;

    for (var activity in activities) {
      final activityCosts = costs.where((c) => c.activityId == activity.id);
      final totalPlannedCost = activityCosts.fold(0.0, (sum, c) => sum + c.plannedCost);

      if (activity.plannedEnd.compareTo(statusDate) <= 0) {
        pv += totalPlannedCost;
      }

      ev += totalPlannedCost * (activity.percentComplete / 100.0);
    }

    for (var cost in costs) {
      if (cost.recordedAt.compareTo(statusDate) <= 0) {
        ac += cost.actualCost;
      }
    }

    double cpi = ac == 0 ? 1.0 : ev / ac;
    double spi = pv == 0 ? 1.0 : ev / pv;

    await db.into(db.evmSnapshots).insert(
      EvmSnapshotsCompanion.insert(
        snapshotDate: statusDate,
        pv: pv,
        ev: ev,
        ac: ac,
        cpi: cpi,
        spi: spi,
      ),
    );
  }
}

class ChangeControlService {
  final AppDatabase db;

  ChangeControlService(this.db);

  Future<void> approveChangeRequest(int crId) async {
    final cr = await (db.select(db.changeRequests)..where((tbl) => tbl.id.equals(crId))).getSingleOrNull();
    if (cr == null) return;

    await db.update(db.changeRequests).replace(cr.copyWith(status: 'approved'));

    final charter = await (db.select(db.projectCharter)..limit(1)).getSingleOrNull();
    if (charter != null) {
      final newBudget = charter.approvedBudget + cr.costImpact;
      final newDeadline = charter.deadlineDate.add(Duration(days: cr.scheduleImpactDays));

      await db.update(db.projectCharter).replace(
        charter.copyWith(
          approvedBudget: newBudget,
          deadlineDate: newDeadline,
        ),
      );
    }
  }
}

final schedulingServiceProvider = Provider<SchedulingService>((ref) {
  return SchedulingService(ref.watch(dbProvider));
});

final evmServiceProvider = Provider<EvmService>((ref) {
  return EvmService(ref.watch(dbProvider));
});

final changeControlServiceProvider = Provider<ChangeControlService>((ref) {
  return ChangeControlService(ref.watch(dbProvider));
});
