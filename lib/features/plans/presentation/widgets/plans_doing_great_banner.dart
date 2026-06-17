import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/widgets/plans_fixtures.dart';

/// Celebratory progress banner in the tablet cockpit
/// (design `grocery_plans_list_tablet`).
class PlansDoingGreatBanner extends StatelessWidget {
  const PlansDoingGreatBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xl),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          const KpMascot.celebrate(size: 120),
          const Gap.l(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.plansDoingGreatTitle,
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: onPrimary,
                  ),
                ),
                const Gap.xs(),
                Text(
                  context.l10n.plansDoingGreatBody(
                    kPlanWeeklySaved.formatShort(),
                  ),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: onPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap.m(),
                _AnalyticsButton(label: context.l10n.plansViewAnalytics),
              ],
            ),
          ),
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
