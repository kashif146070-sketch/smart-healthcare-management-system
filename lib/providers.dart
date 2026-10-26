import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/database.dart';

final dbProvider = Provider((ref) => AppDatabase());
