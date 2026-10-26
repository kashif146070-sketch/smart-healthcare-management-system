import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          // Large screen layout
          return Scaffold(
            body: Container(
              color: const Color(0xFFF4F7F9),
              child: Row(
                children: [
                  _buildCustomSidebar(context),
                  Expanded(child: child),
                ],
              ),
            ),
          );
        } else {
          // Small screen layout
          return Scaffold(
            body: Container(
              color: const Color(0xFFF4F7F9),
              child: child,
            ),
            bottomNavigationBar: _buildNavigationBar(context),
          );
        }
      },
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/initiation')) return 1;
    if (location.startsWith('/scope')) return 2;
    if (location.startsWith('/schedule')) return 3;
    if (location.startsWith('/cost')) return 4;
    if (location.startsWith('/quality')) return 5;
    if (location.startsWith('/reports')) return 6;
    return 0; // Default
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/initiation');
        break;
      case 2:
        context.go('/scope');
        break;
      case 3:
        context.go('/schedule');
        break;
      case 4:
        context.go('/cost');
        break;
      case 5:
        context.go('/quality');
        break;
      case 6:
        context.go('/reports');
        break;
    }
  }

  Widget _buildCustomSidebar(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    return Container(
      width: 260,
      color: const Color(0xFF0F2537),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Header
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A98F),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'CarePlan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'PROJECT MANAGEMENT',
                        style: TextStyle(
                          color: Color(0xFF8DA6B9),
                          fontSize: 10,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Network Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF1F3A4D), width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A98F),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'HEALTHCARE NETWORK',
                        style: TextStyle(
                          color: Color(0xFF8DA6B9),
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Five hospitals',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(context, 0, selectedIndex, Icons.dashboard, 'Dashboard'),
                _buildMenuItem(context, 1, selectedIndex, Icons.play_circle, 'Initiation'),
                _buildMenuItem(context, 2, selectedIndex, Icons.track_changes, 'Scope & WBS'),
                _buildMenuItem(context, 3, selectedIndex, Icons.calendar_month, 'Schedule'),
                _buildMenuItem(context, 4, selectedIndex, Icons.attach_money, 'Cost & EVM'),
                _buildMenuItem(context, 5, selectedIndex, Icons.fact_check, 'Quality & Risk'),
                _buildMenuItem(context, 6, selectedIndex, Icons.bar_chart, 'Reports'),
              ],
            ),
          ),

          // Bottom Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                  child: Text('PM', style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Project team',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '7 assigned members',
                        style: TextStyle(
                          color: Color(0xFF8DA6B9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    int index,
    int selectedIndex,
    IconData icon,
    String title,
  ) {
    final isSelected = index == selectedIndex;
    return InkWell(
      onTap: () => _onItemTapped(index, context),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1A384F) : Colors.transparent,
          border: Border(
            left: BorderSide(
              color: isSelected ? const Color(0xFF00A98F) : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF8DA6B9),
              size: 20,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF8DA6B9),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    return NavigationBar(
      selectedIndex: selectedIndex > 5 ? 0 : selectedIndex,
      onDestinationSelected: (int index) => _onItemTapped(index, context),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        NavigationDestination(icon: Icon(Icons.play_circle), label: 'Initiation'),
        NavigationDestination(icon: Icon(Icons.track_changes), label: 'Scope'),
        NavigationDestination(icon: Icon(Icons.calendar_month), label: 'Schedule'),
        NavigationDestination(icon: Icon(Icons.attach_money), label: 'Cost'),
        NavigationDestination(icon: Icon(Icons.fact_check), label: 'Quality'),
      ],
    );
  }
}
