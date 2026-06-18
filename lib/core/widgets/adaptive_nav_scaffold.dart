import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Shared collapsed/expanded state for the tablet side rail. Kept app-wide so it
/// stays consistent across the home shell and pushed tablet pages, and survives
/// rebuilds such as tab switches.
final ValueNotifier<bool> navRailCollapsed = ValueNotifier<bool>(true);

/// Exposes the side rail's collapsed state to its leading/trailing widgets so
/// they can render compact (icon-only) variants.
class NavRail extends InheritedWidget {
  const NavRail({required this.collapsed, required super.child, super.key});

  final bool collapsed;

  static bool collapsedOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<NavRail>()?.collapsed ?? false;

  @override
  bool updateShouldNotify(NavRail oldWidget) =>
      oldWidget.collapsed != collapsed;
}

/// A navigation destination for [AdaptiveNavScaffold].
@immutable
class AdaptiveDestination {
  const AdaptiveDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label; // already localized by the caller
}

/// Adaptive app shell: a bottom [NavigationBar] on compact (phone) widths and a
/// side [NavigationRail] (master-detail friendly) on medium/expanded (tablet)
/// widths — driven by the design-system breakpoints (`context.isCompact` …).
class AdaptiveNavScaffold extends StatelessWidget {
  const AdaptiveNavScaffold({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
    this.railLeading,
    this.railTrailing,
    super.key,
  });

  final List<AdaptiveDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget body;

  /// Optional header shown at the top of the side rail (tablet) — e.g. the
  /// brand wordmark + profile block (design `home_dashboard_tablet`).
  final Widget? railLeading;

  /// Optional footer pinned to the bottom of the side rail (tablet) — e.g. the
  /// "Create new pocket" button + Help / Logout actions.
  final Widget? railTrailing;

  @override
  Widget build(BuildContext context) {
    if (context.isCompact) {
      return Scaffold(
        body: body,
        // Chunky top edge (design `my_pockets_2`): a 4px border plus a solid
        // upward shadow, with the bar itself flattened so the decoration shows.
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: context.colorScheme.surfaceContainerHighest,
                width: 4,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.outlineVariant.withValues(
                  alpha: 0.3,
                ),
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: NavigationBar(
            backgroundColor: context.colorScheme.surface,
            elevation: 0,
            surfaceTintColor: KpColors.transparent,
            shadowColor: KpColors.transparent,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: [
              for (final d in destinations)
                NavigationDestination(
                  icon: Icon(d.icon),
                  selectedIcon: Icon(d.selectedIcon),
                  label: d.label,
                ),
            ],
          ),
        ),
      );
    }

    // Wide (tablet landscape / desktop): a custom side nav with the design's
    // candy active item. Medium widths fall back to a compact NavigationRail.
    if (context.isExpanded) {
      return Scaffold(
        body: Row(
          children: [
            _SideNav(
              destinations: destinations,
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              leading: railLeading,
              trailing: railTrailing,
            ),
            Expanded(child: body),
          ],
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            indicatorColor: context.colorScheme.primaryContainer,
            destinations: [
              for (final d in destinations)
                NavigationRailDestination(
                  icon: Icon(d.icon),
                  selectedIcon: Icon(d.selectedIcon),
                  label: Text(d.label),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: body),
        ],
      ),
    );
  }
}

/// The expanded side navigation (design `home_dashboard_tablet`): wordmark/
/// profile header, candy-styled active item, and a pinned footer.
///
/// Has two states driven by [navRailCollapsed]: expanded (icon + label, wide)
/// and compact (icon-only, narrow), toggled by the header button.
class _SideNav extends StatelessWidget {
  const _SideNav({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.leading,
    this.trailing,
  });

  static const double _expandedWidth = 280;
  static const double _collapsedWidth = 84;

  final List<AdaptiveDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: navRailCollapsed,
      builder: (context, collapsed, _) {
        return Material(
          color: context.colorScheme.surface,
          child: Container(
            width: collapsed ? _collapsedWidth : _expandedWidth,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: context.colorScheme.surfaceContainerHighest,
                  width: 4,
                ),
              ),
            ),
            child: SafeArea(
              child: NavRail(
                collapsed: collapsed,
                child: Column(
                  children: [
                    _RailToggle(collapsed: collapsed),
                    ?leading,
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: KpSpacing.s,
                          vertical: KpSpacing.s,
                        ),
                        children: [
                          for (var i = 0; i < destinations.length; i++)
                            _SideNavItem(
                              destination: destinations[i],
                              selected: i == selectedIndex,
                              collapsed: collapsed,
                              onTap: () => onDestinationSelected(i),
                            ),
                        ],
                      ),
                    ),
                    ?trailing,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Collapse/expand control pinned to the top of the rail.
class _RailToggle extends StatelessWidget {
  const _RailToggle({required this.collapsed});

  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xs,
      ),
      child: Align(
        alignment: collapsed ? Alignment.center : Alignment.centerRight,
        child: IconButton(
          tooltip: collapsed
              ? context.l10n.navExpandRail
              : context.l10n.navCollapseRail,
          onPressed: () => navRailCollapsed.value = !collapsed,
          icon: Icon(collapsed ? Icons.menu_rounded : Icons.menu_open_rounded),
        ),
      ),
    );
  }
}

class _SideNavItem extends StatelessWidget {
  const _SideNavItem({
    required this.destination,
    required this.selected,
    required this.collapsed,
    required this.onTap,
  });

  final AdaptiveDestination destination;
  final bool selected;
  final bool collapsed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = selected
        ? context.colorScheme.onPrimary
        : context.colorScheme.onSurfaceVariant;
    final icon = Icon(
      selected ? destination.selectedIcon : destination.icon,
      color: fg,
    );
    final item = Container(
      padding: EdgeInsets.symmetric(
        horizontal: collapsed ? KpSpacing.s : KpSpacing.m,
        vertical: KpSpacing.s,
      ),
      alignment: collapsed ? Alignment.center : null,
      decoration: selected
          ? BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: KpRadii.allM,
              border: const Border(
                bottom: BorderSide(color: KpColors.brand600, width: 4),
              ),
            )
          : null,
      child: collapsed
          ? icon
          : Row(
              children: [
                icon,
                const Gap.s(horizontal: true),
                Expanded(
                  child: Text(
                    destination.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.labelLarge?.copyWith(color: fg),
                  ),
                ),
              ],
            ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
      child: Material(
        color: KpColors.transparent,
        borderRadius: KpRadii.allM,
        child: InkWell(
          borderRadius: KpRadii.allM,
          onTap: onTap,
          child: collapsed
              ? Tooltip(message: destination.label, child: item)
              : item,
        ),
      ),
    );
  }
}
