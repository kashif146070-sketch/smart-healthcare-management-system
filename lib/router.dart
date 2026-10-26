import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'presentation/shell.dart';
import 'presentation/screens/initiation_screen.dart';
import 'presentation/screens/scope_screen.dart';
import 'presentation/screens/schedule_screen.dart';
import 'presentation/screens/cost_screen.dart';
import 'presentation/screens/quality_screen.dart';
import 'presentation/screens/dashboard_screen.dart';
import 'presentation/screens/reports_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/initiation',
            builder: (context, state) => const InitiationScreen(),
          ),
          GoRoute(
            path: '/scope',
            builder: (context, state) => const ScopeScreen(),
          ),
          GoRoute(
            path: '/schedule',
            builder: (context, state) => const ScheduleScreen(),
          ),
          GoRoute(
            path: '/cost',
            builder: (context, state) => const CostScreen(),
          ),
          GoRoute(
            path: '/quality',
            builder: (context, state) => const QualityScreen(),
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) => const ReportsScreen(),
          ),
        ],
      ),
    ],
  );
});
