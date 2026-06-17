import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_fixtures.dart';

/// "High Priority Items" card in the tablet cockpit.
class PlansHighPriorityCard extends StatelessWidget {
  const PlansHighPriorityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.bolt_rounded, color: context.colors.warning),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.plansHighPriorityItems,
                style: context.textTheme.titleLarge,
              ),
            ],
          ),
          const Gap.s(),
          for (final item in kPlanPriorityItems)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xs),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(KpSpacing.xs),
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondaryContainer,
                      borderRadius: KpRadii.allM,
                    ),
                    child: Icon(
                      Icons.star_rounded,
                      size: KpSpacing.m,
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const Gap.s(horizontal: true),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name, style: context.textTheme.titleMedium),
                        Text(
                          item.category,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    item.price.format(),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
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

/// Gold "Savings Hack" nudge card in the tablet cockpit.
class PlansSavingsHackCard extends StatelessWidget {
  const PlansSavingsHackCard({super.key});

  @override
  Widget build(BuildContext context) {
    final onGold = context.colorScheme.onSecondaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_rounded, color: onGold),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.plansSavingsHack,
                style: context.textTheme.titleLarge?.copyWith(color: onGold),
              ),
            ],
          ),
          const Gap.s(),
          Text(
            context.l10n.plansSavingsHackBody,
            style: context.textTheme.bodyMedium?.copyWith(
              color: onGold,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap.m(),
          Text(
            context.l10n.plansAiNudge.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: onGold.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
