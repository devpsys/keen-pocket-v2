import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// "Year in Review" hero banner with a celebrating mascot.
class InsightsHero extends StatelessWidget {
  const InsightsHero({super.key});

  @override
  Widget build(BuildContext context) {
    final onHero = context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xl),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.insightsYearInReview,
                  style: context.textTheme.titleLarge?.copyWith(color: onHero),
                ),
                const Gap.s(),
                Text(
                  context.l10n.insightsHeroBody,
                  style: context.textTheme.bodySmall?.copyWith(color: onHero),
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          const KpMascot.celebrate(size: 96),
        ],
      ),
    );
  }
}
