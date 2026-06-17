import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/view_models/plan_view.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_cockpit_card.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_doing_great_banner.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_fixtures.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_side_cards.dart';

/// Tablet "Savings Cockpit" layout (design `grocery_plans_list_tablet`):
/// a header, two wide plan cards, a progress banner, and the high-priority /
/// savings-hack side cards.
class PlansCockpitView extends StatelessWidget {
  const PlansCockpitView({required this.plans, this.onOpenPlan, super.key});

  final List<PlanView> plans;
  final ValueChanged<String>? onOpenPlan;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.plansCockpitTitle,
                    style: context.textTheme.headlineLarge,
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.plansCockpitSubtitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap.m(horizontal: true),
            const _MonthlyGoalChip(percent: kPlanGoalPercent),
          ],
        ),
        const Gap.l(),
        _PlanRow(plans: plans, onOpenPlan: onOpenPlan),
        const Gap.l(),
        const PlansDoingGreatBanner(),
        const Gap.l(),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: PlansHighPriorityCard()),
            Gap.l(horizontal: true),
            Expanded(child: PlansSavingsHackCard()),
          ],
        ),
      ],
    );
  }
}

/// Lays the plans out two-per-row as equal-height cards.
class _PlanRow extends StatelessWidget {
  const _PlanRow({required this.plans, this.onOpenPlan});

  final List<PlanView> plans;
  final ValueChanged<String>? onOpenPlan;

  @override
  Widget build(BuildContext context) {
    final rows = <List<PlanView>>[
      for (var i = 0; i < plans.length; i += 2)
        plans.sublist(i, (i + 2).clamp(0, plans.length)),
    ];
    return Column(
      children: [
        for (var r = 0; r < rows.length; r++) ...[
          if (r > 0) const Gap.l(),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var c = 0; c < 2; c++) ...[
                  if (c > 0) const Gap.l(horizontal: true),
                  Expanded(
                    child: c < rows[r].length
                        ? PlanCockpitCard(
                            plan: rows[r][c],
                            onTap: () => onOpenPlan?.call(rows[r][c].id),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _MonthlyGoalChip extends StatelessWidget {
  const _MonthlyGoalChip({required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.s,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            context.l10n.plansMonthlyGoal,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            context.l10n.plansGoalReached(percent),
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
