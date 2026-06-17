import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_common.dart';

class AdashiCard extends StatelessWidget {
  const AdashiCard({required this.adashi, this.onTap, super.key});

  final DashboardAdashiView adashi;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    final onGold = context.colorScheme.onSecondaryContainer;
    return GestureDetector(
      onTap: () => onTap?.call(adashi.id),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.l),
        decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          borderRadius: KpRadii.allXl,
          border: Border(
            bottom: BorderSide(color: context.colors.warning, width: 7),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: DashboardPill(
                label: context.l10n.adashiCycleProgress(
                  adashi.cycleCurrent,
                  adashi.cycleTotal,
                ),
              ),
            ),
            Text(
              adashi.name,
              style: context.textTheme.titleLarge?.copyWith(color: onGold),
            ),
            const Gap.xxs(),
            Text(
              context.l10n
                  .dashboardMembersParticipating(adashi.members)
                  .toUpperCase(),
              style: context.textTheme.labelSmall?.copyWith(color: onGold),
            ),
            const Gap.s(),
            Text(
              context.l10n.dashboardPerCycle(adashi.perCycle.formatShort()),
              style: context.textTheme.titleMedium?.copyWith(color: onGold),
            ),
          ],
        ),
      ),
    );
  }
}
