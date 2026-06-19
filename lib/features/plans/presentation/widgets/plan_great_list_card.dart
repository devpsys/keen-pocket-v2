import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Blue "Great list!" callout on the tablet plan-detail screen (design
/// `grocery_plan_detail_tablet`): a primary-colored card with Mr K, a
/// congratulatory message and a View Analytics action.
class PlanGreatListCard extends StatelessWidget {
  const PlanGreatListCard({super.key});

  static const double _mascot = 72;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
      ),
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
                      context.l10n.planGreatList,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: onPrimary,
                      ),
                    ),
                    const Gap.xs(),
                    Text(
                      context.l10n.planGreatListBody,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: onPrimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              const KpMascot.celebrate(size: _mascot),
            ],
          ),
          const Gap.m(),
          _AnalyticsButton(label: context.l10n.plansViewAnalytics),
        ],
      ),
    );
  }
}

class _AnalyticsButton extends StatelessWidget {
  const _AnalyticsButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.onPrimary,
      borderRadius: KpRadii.allM,
      child: InkWell(
        borderRadius: KpRadii.allM,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.l,
            vertical: KpSpacing.s,
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
