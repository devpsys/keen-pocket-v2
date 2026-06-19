import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_budget_health_card.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_checklist_card.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_collaborators_card.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_detail_fixtures.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_great_list_card.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_stat_card.dart';

/// Tablet/desktop "Savings Cockpit" layout for the grocery plan detail screen
/// (design `grocery_plan_detail_tablet`): a top row of four stat cards, then a
/// two-column area — a wider left column (budget health + item checklist) and a
/// narrower right column (collaborators + a "Great list!" callout).
class PlanDetailTabletView extends StatelessWidget {
  const PlanDetailTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          children: [
            Expanded(
              child: PlanStatCard(
                icon: KpIcons.shopping,
                label: context.l10n.planDetailTotalItems,
                value: '$kPlanDetailTotalItems',
                valueColor: context.colorScheme.primary,
              ),
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: PlanStatCard(
                icon: Icons.check_circle_rounded,
                label: context.l10n.planDetailBought,
                value: '$kPlanDetailBoughtCount',
                valueColor: context.colors.success,
              ),
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: PlanStatCard(
                icon: Icons.history_rounded,
                label: context.l10n.planDetailDeferred,
                value: '$kPlanDetailDeferredCount',
                valueColor: context.colorScheme.error,
              ),
            ),
            const Gap.m(horizontal: true),
            Expanded(
              child: PlanStatCard(
                icon: KpIcons.payments,
                label: context.l10n.planDetailEstimated,
                value: kPlanDetailEstimated.format(),
                valueColor: context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const Gap.l(),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PlanBudgetHealthCard(),
                  Gap.l(),
                  PlanChecklistCard(),
                ],
              ),
            ),
            Gap.l(horizontal: true),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PlanCollaboratorsCard(),
                  Gap.l(),
                  PlanGreatListCard(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
