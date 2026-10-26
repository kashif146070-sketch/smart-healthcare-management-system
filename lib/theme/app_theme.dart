import 'package:flutter/material.dart';

class CarePlanTheme {
  // Brand Colors
  static const Color sidebarBg = Color(0xFF092038); // Dark Navy Blue
  static const Color sidebarActiveBg = Color(0xFF13385E);
  static const Color sidebarActiveBorder = Color(0xFF00A389);
  
  static const Color primaryTeal = Color(0xFF008075); // CarePlan Teal
  static const Color primaryTealDark = Color(0xFF00665E);
  static const Color primaryTealLight = Color(0xFFE6F5F3);
  
  static const Color pageBg = Color(0xFFF4F6F9);
  static const Color cardBg = Colors.white;
  static const Color cardBorder = Color(0xFFEAEEF4);

  // Text Colors
  static const Color textDark = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textLight = Color(0xFF94A3B8);

  // Status Colors
  static const Color statusGreenBg = Color(0xFFE6F4EA);
  static const Color statusGreenText = Color(0xFF137333);
  
  static const Color statusYellowBg = Color(0xFFFEF7E0);
  static const Color statusYellowText = Color(0xFFB06000);

  static const Color statusRedBg = Color(0xFFFCE8E6);
  static const Color statusRedText = Color(0xFFC5221F);

  static const Color statusOrangeBg = Color(0xFFFFECD9);
  static const Color statusOrangeText = Color(0xFFD97706);

  static const Color statusGreyBg = Color(0xFFF1F5F9);
  static const Color statusGreyText = Color(0xFF475569);

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: pageBg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryTeal,
        primary: primaryTeal,
        surface: pageBg,
      ),
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: cardBorder, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryTeal, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryTeal,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}

class CarePlanBadge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const CarePlanBadge({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  factory CarePlanBadge.approved() {
    return const CarePlanBadge(
      label: 'Approved',
      backgroundColor: CarePlanTheme.statusGreenBg,
      textColor: CarePlanTheme.statusGreenText,
    );
  }

  factory CarePlanBadge.complete() {
    return const CarePlanBadge(
      label: 'Complete',
      backgroundColor: CarePlanTheme.statusGreenBg,
      textColor: CarePlanTheme.statusGreenText,
    );
  }

  factory CarePlanBadge.proposed([String label = 'Proposed']) {
    return CarePlanBadge(
      label: label,
      backgroundColor: CarePlanTheme.statusYellowBg,
      textColor: CarePlanTheme.statusYellowText,
    );
  }

  factory CarePlanBadge.pending([String label = 'Pending']) {
    return CarePlanBadge(
      label: label,
      backgroundColor: CarePlanTheme.statusYellowBg,
      textColor: CarePlanTheme.statusYellowText,
    );
  }

  factory CarePlanBadge.inProgress([String label = 'In progress']) {
    return CarePlanBadge(
      label: label,
      backgroundColor: CarePlanTheme.statusYellowBg,
      textColor: CarePlanTheme.statusYellowText,
    );
  }

  factory CarePlanBadge.critical([String label = 'Critical']) {
    return CarePlanBadge(
      label: label,
      backgroundColor: CarePlanTheme.statusRedBg,
      textColor: CarePlanTheme.statusRedText,
    );
  }

  factory CarePlanBadge.high([String label = 'High']) {
    return CarePlanBadge(
      label: label,
      backgroundColor: CarePlanTheme.statusRedBg,
      textColor: CarePlanTheme.statusRedText,
    );
  }

  factory CarePlanBadge.medium([String label = 'Medium']) {
    return CarePlanBadge(
      label: label,
      backgroundColor: CarePlanTheme.statusOrangeBg,
      textColor: CarePlanTheme.statusOrangeText,
    );
  }

  factory CarePlanBadge.deliverable() {
    return const CarePlanBadge(
      label: 'Deliverable',
      backgroundColor: CarePlanTheme.statusGreyBg,
      textColor: CarePlanTheme.statusGreyText,
    );
  }

  factory CarePlanBadge.workPackage() {
    return const CarePlanBadge(
      label: 'Work package',
      backgroundColor: CarePlanTheme.statusGreyBg,
      textColor: CarePlanTheme.statusGreyText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
