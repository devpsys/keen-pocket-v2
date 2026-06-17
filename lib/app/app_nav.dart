import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/widgets/adaptive_nav_scaffold.dart';
import 'package:keenpockets/features/pockets/pockets.dart';

/// Primary navigation destinations, shared by the home shell and the secondary
/// tablet pages so the side rail is identical everywhere. Index order is the
/// source of truth for the shell's `IndexedStack`.
List<AdaptiveDestination> appNavDestinations(BuildContext context) => [
  AdaptiveDestination(
    icon: KpIcons.dashboardOutlined,
    selectedIcon: KpIcons.dashboard,
    label: context.l10n.dashboardTitle,
  ),
  AdaptiveDestination(
    icon: KpIcons.pocketsOutlined,
    selectedIcon: KpIcons.pockets,
    label: context.l10n.pocketsTitle,
  ),
  AdaptiveDestination(
    icon: KpIcons.adashiOutlined,
    selectedIcon: KpIcons.adashi,
    label: context.l10n.adashiTitle,
  ),
  AdaptiveDestination(
    icon: KpIcons.discoverOutlined,
    selectedIcon: KpIcons.discover,
    label: context.l10n.discoverTitle,
  ),
  AdaptiveDestination(
    icon: KpIcons.profileOutlined,
    selectedIcon: KpIcons.profile,
    label: context.l10n.profileTitle,
  ),
];

/// Index of the Pockets tab — used as the active rail item on pocket sub-pages.
const int kPocketsTabIndex = 1;

/// Wraps a secondary page's [body] with the persistent side rail on tablets so
/// the navigation stays visible (design `*_tablet`). On phones it returns the
/// body unchanged. Rail taps return to the shell on the chosen tab.
class AppTabletShell extends StatelessWidget {
  const AppTabletShell({
    required this.body,
    this.selectedIndex = kPocketsTabIndex,
    this.onLogout,
    super.key,
  });

  final Widget body;
  final int selectedIndex;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    if (!context.isExpanded) return body;
    return AdaptiveNavScaffold(
      selectedIndex: selectedIndex,
      onDestinationSelected: (i) => context.go('/home?tab=$i'),
      railLeading: const AppRailHeader(),
      railTrailing: AppRailFooter(onLogout: onLogout),
      destinations: appNavDestinations(context),
      body: body,
    );
  }
}

/// Side-rail header (tablet): brand wordmark + the signed-in user's profile
/// block (design `home_dashboard_tablet`).
class AppRailHeader extends StatelessWidget {
  const AppRailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getIt<SessionManager>().currentUser;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.m,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.brandWordmark,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.m),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: KpRadii.allL,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: KpSpacing.l,
                  backgroundColor: context.colorScheme.primaryContainer,
                  child: Icon(
                    KpIcons.profile,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.name ?? context.l10n.profileTitle,
                        style: context.textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        context.l10n.profileReputation,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
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
}

/// Side-rail footer (tablet): create-pocket CTA + Help / Logout.
class AppRailFooter extends StatelessWidget {
  const AppRailFooter({this.onLogout, super.key});

  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(horizontal: KpSpacing.xs),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(KpSpacing.s),
            child: KpButton(
              label: context.l10n.createPocketTitle,
              icon: KpIcons.add,
              onPressed: () => Navigator.of(context).push<void>(
                MaterialPageRoute(builder: (_) => const CreatePocketPage()),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(KpIcons.help),
            title: Text(
              context.l10n.authHelp,
              style: context.textTheme.labelLarge,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(KpIcons.logout),
            title: Text(
              context.l10n.logout,
              style: context.textTheme.labelLarge,
            ),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
