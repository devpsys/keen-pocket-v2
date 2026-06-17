import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';

class StatGrid extends StatelessWidget {
  const StatGrid({required this.data, this.onOpenWallet, super.key});

  final DashboardView data;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    final cards = <Widget>[
      StatCard(
        icon: Icons.folder_rounded,
        tint: context.colorScheme.primary,
        value: '${data.activePockets}',
        caption: context.l10n.dashboardActivePockets,
      ),
      StatCard(
        icon: Icons.groups_rounded,
        tint: context.colors.warning,
        value: '${data.adashiGroups}',
        caption: context.l10n.dashboardAdashiGroups,
      ),
      StatCard(
        icon: Icons.verified_user_rounded,
        tint: context.colorScheme.primary,
        value: data.reputationTier,
        caption: context.l10n.dashboardReputation,
      ),
      StatCard(
        icon: Icons.account_balance_wallet_rounded,
        tint: context.colorScheme.error,
        value: data.walletBalance.formatShort(),
        caption: context.l10n.dashboardWalletBalance,
        onTap: onOpenWallet,
      ),
    ];

    // Tablet/desktop: all four stats on one row. Phone: a 2×2 grid.
    if (context.isExpanded) {
      return Row(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const Gap.s(horizontal: true),
            Expanded(child: cards[i]),
          ],
        ],
      );
    }
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: cards[0]),
            const Gap.s(horizontal: true),
            Expanded(child: cards[1]),
          ],
        ),
        const Gap.s(),
        Row(
          children: [
            Expanded(child: cards[2]),
            const Gap.s(horizontal: true),
            Expanded(child: cards[3]),
          ],
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    required this.icon,
    required this.tint,
    required this.value,
    required this.caption,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final Color tint;
  final String value;
  final String caption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.xs),
            decoration: BoxDecoration(
              color: tint.withValues(alpha: 0.12),
              borderRadius: KpRadii.allM,
            ),
            child: Icon(icon, color: tint, size: KpSpacing.l),
          ),
          const Gap.s(),
          Text(value, style: context.textTheme.titleLarge),
          Text(
            caption.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
    if (onTap == null) return card;
    return GestureDetector(onTap: onTap, child: card);
  }
}
