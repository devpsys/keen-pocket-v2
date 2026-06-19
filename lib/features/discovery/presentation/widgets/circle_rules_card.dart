import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_fixtures.dart';

/// "Circle Rules" card listing the public circle's governance rules.
class CircleRulesCard extends StatelessWidget {
  const CircleRulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.exploreCircleRules,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.s(),
          for (final rule in kCircleRules)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: KpSpacing.l,
                    color: context.colorScheme.primary,
                  ),
                  const Gap.s(horizontal: true),
                  Expanded(
                    child: Text(
                      rule,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
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
