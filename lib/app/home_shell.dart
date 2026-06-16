import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/adaptive_nav_scaffold.dart';
import 'package:keenpockets/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:keenpockets/features/pockets/pockets.dart';

/// Authenticated app shell: adaptive bottom-nav (phone) / rail (tablet) hosting
/// the primary tabs. Each tab keeps its own subtree via an [IndexedStack].
class HomeShell extends StatefulWidget {
  const HomeShell({this.onOpenPocket, this.onLogout, super.key});

  final ValueChanged<String>? onOpenPocket;
  final VoidCallback? onLogout;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      PocketsPage(onOpenPocket: widget.onOpenPocket),
      DashboardPage(onLogout: widget.onLogout),
    ];

    return AdaptiveNavScaffold(
      selectedIndex: _index,
      onDestinationSelected: (i) => setState(() => _index = i),
      destinations: [
        AdaptiveDestination(
          icon: Icons.savings_outlined,
          selectedIcon: Icons.savings,
          label: context.l10n.pocketsTitle,
        ),
        AdaptiveDestination(
          icon: Icons.dashboard_outlined,
          selectedIcon: Icons.dashboard,
          label: context.l10n.dashboardTitle,
        ),
      ],
      body: IndexedStack(index: _index, children: tabs),
    );
  }
}
