import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final avatar = Padding(
      padding: const EdgeInsets.only(right: KpSpacing.m),
      child: CircleAvatar(
        radius: KpSpacing.m,
        backgroundColor: context.colorScheme.primaryContainer,
        child: Icon(
          KpIcons.profile,
          size: KpSpacing.m,
          color: context.colorScheme.onPrimaryContainer,
        ),
      ),
    );
    final bell = IconButton(
      onPressed: () {},
      icon: const Icon(KpIcons.notificationsOutlined),
    );

    // Tablet: the rail carries the wordmark, so the bar shows section tabs +
    // search + actions (design `home_dashboard_tablet`).
    if (context.isExpanded) {
      return AppBar(
        titleSpacing: KpSpacing.l,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavTab(label: context.l10n.dashboardTabOverview, active: true),
            const Gap.l(horizontal: true),
            NavTab(label: context.l10n.dashboardTabHistory),
            const Gap.l(horizontal: true),
            NavTab(label: context.l10n.dashboardTabAnalytics),
          ],
        ),
        actions: [const SearchField(), bell, avatar],
      );
    }
    return AppBar(
      title: Text(
        context.l10n.brandWordmark,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [bell, avatar],
    );
  }
}

class NavTab extends StatelessWidget {
  const NavTab({required this.label, this.active = false, super.key});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active
        ? context.colorScheme.primary
        : context.colorScheme.onSurfaceVariant;
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: active ? FontWeight.w800 : FontWeight.w700,
            ),
          ),
          const Gap.xxs(),
          Container(height: 4, color: active ? color : KpColors.transparent),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: KpSpacing.s),
      child: TextField(
        style: context.textTheme.bodyMedium,
        decoration: InputDecoration(
          isDense: true,
          hintText: context.l10n.dashboardSearchHint,
          hintStyle: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          prefixIcon: const Icon(KpIcons.search, size: KpSpacing.l),
        ),
      ),
    );
  }
}
