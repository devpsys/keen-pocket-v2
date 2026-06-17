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
        color: context.colors.warningContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.emoji_events_rounded, color: context.colors.warning),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.pocketDetailTopContributors,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
          const Gap.s(),
          for (var i = 0; i < kPocketTopContributors.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
              child: Row(
                children: [
                  Text('${i + 1}', style: context.textTheme.titleMedium),
                  const Gap.s(horizontal: true),
                  Expanded(
                    child: Text(
                      kPocketTopContributors[i].name,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    kPocketTopContributors[i].amount.format(),
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
