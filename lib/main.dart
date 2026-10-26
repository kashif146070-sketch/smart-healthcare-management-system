import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_healthcare_management_system/router.dart';
import 'package:smart_healthcare_management_system/providers.dart';
import 'package:smart_healthcare_management_system/data/seed_data.dart';
import 'package:smart_healthcare_management_system/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _isDbSeeded = false;

  @override
  void initState() {
    super.initState();
    _seedDb();
  }

  Future<void> _seedDb() async {
    final db = ref.read(dbProvider);
    await seedDatabase(db, forceReset: true);
    if (mounted) {
      setState(() {
        _isDbSeeded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isDbSeeded) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'CarePlan - Project Management',
      debugShowCheckedModeBanner: false,
      theme: CarePlanTheme.themeData,
      routerConfig: router,
    );
  }
}
