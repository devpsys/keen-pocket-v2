import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_common.dart';

class TabletAdashiCard extends StatelessWidget {
  const TabletAdashiCard({required this.adashi, this.onTap, super.key});

  final DashboardAdashiView adashi;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return KpCard.interactive(
      onTap: () => onTap?.call(adashi.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardIconBox(
                icon: KpIcons.groups,
                boxColor: context.colorScheme.secondaryContainer,
                iconColor: context.colorScheme.onSecondaryContainer,
              ),
              DashboardTagPill(
                label: context.l10n.dashboardActiveCycle,
                bg: context.colorScheme.secondaryContainer,
                fg: context.colorScheme.onSecondaryContainer,
              ),
            ],
          ),
          const Gap.s(),
          Text(adashi.name, style: context.textTheme.titleMedium),
          const Gap.xs(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.adashiCycleProgress(
                  adashi.cycleCurrent,
                  adashi.cycleTotal,
                ),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                context.l10n.dashboardPerCycle(adashi.perCycle.formatShort()),
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.s(),
          AvatarStack(total: adashi.members),
          const Gap.xs(),
          Text(
            context.l10n.dashboardMembersParticipating(adashi.members),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
