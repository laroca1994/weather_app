// --- Weather Screen Widget ---
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedColor = colorScheme.primary;
    final unselectedColor = colorScheme.onSurfaceVariant;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (int index) {
          // Navegación al tocar la pestaña (sin cambios)
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          ...HomeTabs.values.map(
            (t) => NavigationDestination(
              icon: Icon(t.icon, color: unselectedColor),
              selectedIcon: Icon(t.icon, color: selectedColor),
              label: t.label,
            ),
          ),
        ],
      ),
      body: widget.navigationShell,
    );
  }
}

enum HomeTabs {
  weather,
  history;

  String get label {
    switch (this) {
      case weather:
        return 'Weather';
      case HomeTabs.history:
        return 'History';
    }
  }

  IconData get icon {
    switch (this) {
      case HomeTabs.weather:
        return Icons.wb_sunny;
      case HomeTabs.history:
        return Icons.history_toggle_off;
    }
  }
}
