import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Checklist of the pocket's group rules.
class PocketGroupRulesCard extends StatelessWidget {
  const PocketGroupRulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final rules = [
      context.l10n.pocketDetailRule1,
      context.l10n.pocketDetailRule2,
      context.l10n.pocketDetailRule3,
    ];
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.pocketDetailGroupRules,
            style: context.textTheme.titleLarge,
          ),
          const Gap.s(),
          for (final rule in rules)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: KpSpacing.m,
                    color: context.colorScheme.primary,
                  ),
                  const Gap.xs(horizontal: true),
                  Expanded(
                    child: Text(rule, style: context.textTheme.bodySmall),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
