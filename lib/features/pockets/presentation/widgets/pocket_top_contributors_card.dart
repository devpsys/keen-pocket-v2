import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Warm-tinted leaderboard of the pocket's top contributors.
class PocketTopContributorsCard extends StatelessWidget {
  const PocketTopContributorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                KpIcons.medal,
                color: context.colorScheme.onSecondaryContainer,
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.pocketDetailTopContributors,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          const Gap.s(),
          for (var i = 0; i < kPocketTopContributors.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
              child: Row(
                children: [
                  Text(
                    '${i + 1}',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  const Gap.s(horizontal: true),
                  Expanded(
                    child: Text(
                      kPocketTopContributors[i].name,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  Text(
                    kPocketTopContributors[i].amount.format(),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.onSecondaryContainer,
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
