import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/view_models/plan_view.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_card.dart';

/// Wide plan card for the tablet cockpit: budget bar plus a bought/pending/
/// deferred stat row (design `grocery_plans_list_tablet`).
class PlanCockpitCard extends StatelessWidget {
  const PlanCockpitCard({required this.plan, this.onTap, super.key});

  final PlanView plan;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tone = planBudgetTone(context, plan.budgetProgress);
    return KpCard.interactive(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: context.colorScheme.secondaryContainer,
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(
                  KpIcons.shopping,
                  color: context.colorScheme.onSecondaryContainer,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plan.name,
                      style: context.textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      planCadenceLabel(context, plan.cadence),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.plansBudgetProgress,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '${plan.spent.formatShort()} / ${plan.budget.formatShort()}',
                style: context.textTheme.labelLarge?.copyWith(color: tone),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(value: plan.budgetProgress, color: tone),
          const Gap.l(),
          Row(
            children: [
              Expanded(
                child: _StatColumn(
                  value: '${plan.bought}',
                  label: context.l10n.plansStatBought,
                ),
              ),
              Expanded(
                child: _StatColumn(
                  value: '${plan.pending}',
                  label: context.l10n.plansStatPending,
                ),
              ),
              Expanded(
                child: _StatColumn(
                  value: '${plan.deferred}',
                  label: context.l10n.plansStatDeferred,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: context.textTheme.headlineMedium),
        Text(
          label.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
