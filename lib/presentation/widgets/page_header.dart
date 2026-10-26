import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CarePlanPageHeader extends StatelessWidget {
  final String breadcrumbModule;
  final String moduleTag;
  final String title;
  final String subtitle;
  final Widget? action;

  const CarePlanPageHeader({
    super.key,
    required this.breadcrumbModule,
    required this.moduleTag,
    required this.title,
    required this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Breadcrumb & Workspace Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'CarePlan',
                    style: TextStyle(
                      color: CarePlanTheme.textMuted,
                      fontSize: 13,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '/',
                      style: TextStyle(
                        color: CarePlanTheme.textLight,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    breadcrumbModule,
                    style: TextStyle(
                      color: CarePlanTheme.textDark,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A98F),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Persistent SQLite workspace',
                    style: TextStyle(
                      color: CarePlanTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Title & Module Tag
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      moduleTag.toUpperCase(),
                      style: TextStyle(
                        color: CarePlanTheme.primaryTeal,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: TextStyle(
                        color: CarePlanTheme.textDark,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: CarePlanTheme.textMuted,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (action != null) action!,
            ],
          ),
        ],
      ),
    );
  }
}
