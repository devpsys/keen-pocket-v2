import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
class _SideNav extends StatelessWidget {
  const _SideNav({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.leading,
    this.trailing,
  });

  static const double _width = 280;

  final List<AdaptiveDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      child: Container(
        width: _width,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: context.colorScheme.surfaceContainerHighest,
              width: 4,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
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
    );
  }
}

class _SideNavItem extends StatelessWidget {
  const _SideNavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final AdaptiveDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = selected
        ? context.colorScheme.onPrimary
        : context.colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
      child: Material(
        color: KpColors.transparent,
        borderRadius: KpRadii.allM,
        child: InkWell(
          borderRadius: KpRadii.allM,
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.m,
              vertical: KpSpacing.s,
            ),
            decoration: selected
                ? BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: KpRadii.allM,
                    border: const Border(
                      bottom: BorderSide(color: KpColors.brand600, width: 4),
                    ),
                  )
                : null,
            child: Row(
              children: [
                Icon(
                  selected ? destination.selectedIcon : destination.icon,
                  color: fg,
                ),
                const Gap.s(horizontal: true),
                Text(
                  destination.label,
                  style: context.textTheme.labelLarge?.copyWith(color: fg),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
