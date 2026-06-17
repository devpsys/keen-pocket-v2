import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/features/plans/presentation/view_models/plan_view.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_card.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plan_welcome_card.dart';

/// Phone layout for the plans list (design `grocery_plans_list`): a Mr K
/// welcome banner followed by one budget-progress card per plan.
class PlansListView extends StatelessWidget {
  const PlansListView({required this.plans, this.onOpenPlan, super.key});

  final List<PlanView> plans;
  final ValueChanged<String>? onOpenPlan;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.m),
      children: [
        const PlanWelcomeCard(),
        const Gap.l(),
        for (final plan in plans) ...[
          PlanCard(plan: plan, onTap: () => onOpenPlan?.call(plan.id)),
          const Gap.m(),
        ],
      ],
    );
  }
}
