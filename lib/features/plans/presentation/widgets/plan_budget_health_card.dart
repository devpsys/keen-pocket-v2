import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_fixtures.dart';

/// Budget Health card on the tablet plan-detail screen (design
/// `grocery_plan_detail_tablet`): "spent of budget" line, a percent on the
/// right and a thick progress bar.
class PlanBudgetHealthCard extends StatelessWidget {
  const PlanBudgetHealthCard({super.key});

  @override
  Widget build(BuildContext context) {
    final fraction = kPlanDetailSpent.kobo / kPlanDetailBudget.kobo;
    final percent = (fraction * 100).round();
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.planDetailBudgetHealth,
                      style: context.textTheme.titleLarge,
                    ),
                    const Gap.xxs(),
                    Text(
                      context.l10n.planDetailSpentOf(
                        kPlanDetailSpent.format(),
                        kPlanDetailBudget.format(),
                      ),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              Text(
                '$percent%',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.colors.warning,
                ),
              ),
            ],
          ),
          const Gap.m(),
          KpProgressBar(value: fraction, color: context.colors.warning),
        ],
      ),
    );
  }
}
