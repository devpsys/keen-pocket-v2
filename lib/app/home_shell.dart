import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/core/widgets/adaptive_nav_scaffold.dart';
import 'package:keenpockets/features/adashi/adashi.dart';
import 'package:keenpockets/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:keenpockets/features/discovery/discovery.dart';
import 'package:keenpockets/features/pockets/pockets.dart';
import 'package:keenpockets/features/profile/profile.dart';

/// Authenticated app shell: adaptive bottom-nav (phone) / side rail (tablet)
/// hosting the primary tabs. Each tab keeps its own subtree via an [IndexedStack].
class HomeShell extends StatefulWidget {
  const HomeShell({
    this.initialIndex,
    this.onOpenPocket,
    this.onOpenAdashi,
    this.onOpenWallet,
    this.onOpenNotifications,
    this.onOpenAchievements,
    this.onOpenTrust,
    this.onOpenFriends,
    this.onOpenSchool,
    this.onOpenAdmin,
    this.onOpenLegal,
    this.onLogout,
    super.key,
  });

  /// Tab to select on first build (deep-link / rail navigation from a
  /// secondary page). Defaults to the first tab (Dashboard).
  final int? initialIndex;

  final ValueChanged<String>? onOpenPocket;
  final ValueChanged<String>? onOpenAdashi;
  final VoidCallback? onOpenWallet;
  final VoidCallback? onOpenNotifications;
  final VoidCallback? onOpenAchievements;
  final VoidCallback? onOpenTrust;
  final VoidCallback? onOpenFriends;
  final VoidCallback? onOpenSchool;
  final VoidCallback? onOpenAdmin;
  final VoidCallback? onOpenLegal;
  final VoidCallback? onLogout;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  late int _index = widget.initialIndex ?? 0;
  late final Stream<bool> _connectivity =
      getIt<ConnectivityChecker>().onStatusChanged;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      DashboardPage(
        onOpenPocket: widget.onOpenPocket,
        onOpenAdashi: widget.onOpenAdashi,
        onOpenWallet: widget.onOpenWallet,
      ),
      PocketsPage(onOpenPocket: widget.onOpenPocket),
      AdashiListPage(onOpenAdashi: widget.onOpenAdashi),
      const DiscoveryPage(),
      ProfilePage(
        onOpenWallet: widget.onOpenWallet,
        onOpenNotifications: widget.onOpenNotifications,
        onOpenAchievements: widget.onOpenAchievements,
        onOpenTrust: widget.onOpenTrust,
        onOpenFriends: widget.onOpenFriends,
        onOpenSchool: widget.onOpenSchool,
        onOpenAdmin: widget.onOpenAdmin,
        onOpenLegal: widget.onOpenLegal,
        onLogout: widget.onLogout,
      ),
    ];

    return Column(
      children: [
        StreamBuilder<bool>(
          stream: _connectivity,
          builder: (context, snapshot) {
            final online = snapshot.data ?? true;
            if (online) return const SizedBox.shrink();
            return KpOfflineBanner(message: context.l10n.offlineBanner);
          },
        ),
        Expanded(
          child: AdaptiveNavScaffold(
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            railLeading: context.isExpanded ? const AppRailHeader() : null,
            railTrailing: context.isExpanded
                ? AppRailFooter(onLogout: widget.onLogout)
                : null,
            destinations: appNavDestinations(context),
            body: IndexedStack(index: _index, children: tabs),
          ),
        ),
      ],
    );
  }
}
