import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_common.dart';

class TabletDashboardPocketCard extends StatelessWidget {
  const TabletDashboardPocketCard({
    required this.pocket,
    this.onOpenPocket,
    super.key,
  });

  final DashboardPocketView pocket;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    return KpCard.interactive(
      onTap: () => onOpenPocket?.call(pocket.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardIconBox(
                icon: KpIcons.savings,
                boxColor: context.colorScheme.errorContainer,
                iconColor: context.colorScheme.error,
              ),
              DashboardTagPill(
                label: context.l10n.dashboardInProgress,
                bg: context.colorScheme.primaryContainer,
                fg: context.colorScheme.onPrimaryContainer,
              ),
            ],
          ),
          const Gap.s(),
          Text(pocket.name, style: context.textTheme.titleMedium),
          const Gap.xs(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.dashboardPerHand(pocket.handPrice.formatShort()),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                pocket.scheduleLabel,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(value: 0.45, color: context.colorScheme.error),
          const Gap.xs(),
          Text(
            context.l10n.dashboardGoalReached(45),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
