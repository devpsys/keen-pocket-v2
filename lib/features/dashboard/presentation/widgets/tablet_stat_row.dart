import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';

class TabletStatRow extends StatelessWidget {
  const TabletStatRow({required this.data, this.onOpenWallet, super.key});

  final DashboardView data;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    final cards = <Widget>[
      TabletStatCard(
        icon: KpIcons.folder,
        boxColor: context.colorScheme.secondaryContainer,
        iconColor: context.colorScheme.onSecondaryContainer,
        label: context.l10n.dashboardActivePockets,
        value: '${data.activePockets}',
      ),
      TabletStatCard(
        icon: KpIcons.group,
        boxColor: context.colorScheme.errorContainer,
        iconColor: context.colorScheme.error,
        label: context.l10n.dashboardAdashiGroups,
        value: '${data.adashiGroups}',
      ),
      TabletStatCard(
        icon: KpIcons.verified,
        boxColor: context.colorScheme.primaryContainer,
        iconColor: context.colorScheme.onPrimaryContainer,
        label: context.l10n.dashboardReputation,
        value: data.reputationTier,
      ),
      TabletStatCard(
        icon: KpIcons.wallet,
        boxColor: context.colorScheme.surfaceContainerHighest,
        iconColor: context.colorScheme.primary,
        label: context.l10n.dashboardWalletBalance,
        value: data.walletBalance.formatShort(),
        onTap: onOpenWallet,
      ),
    ];
    return Row(
      children: [
        for (var i = 0; i < cards.length; i++) ...[
          if (i > 0) const Gap.m(horizontal: true),
          Expanded(child: cards[i]),
        ],
      ],
    );
  }
}

class TabletStatCard extends StatelessWidget {
  const TabletStatCard({
    required this.icon,
    required this.boxColor,
    required this.iconColor,
    required this.label,
    required this.value,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final Color boxColor;
  final Color iconColor;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = KpCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: KpRadii.allM,
            ),
            child: Icon(icon, color: iconColor),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: context.textTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    if (onTap == null) return card;
    return GestureDetector(onTap: onTap, child: card);
  }
}
