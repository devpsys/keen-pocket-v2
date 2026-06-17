import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Mr K welcome banner atop the plans list (design `grocery_plans_list`).
class PlanWelcomeCard extends StatelessWidget {
  const PlanWelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: KpMascot(size: 96)),
          const Gap.m(),
          Text(
            context.l10n.plansWelcomeTitle,
            style: context.textTheme.headlineMedium,
          ),
          const Gap.xs(),
          Text(
            context.l10n.plansWelcomeBody,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
