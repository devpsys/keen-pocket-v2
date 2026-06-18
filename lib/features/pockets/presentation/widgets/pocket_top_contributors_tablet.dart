import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Brand-tinted leaderboard of the pocket's top contributors, ranked with big
/// italic numerals.
class PocketTopContributorsTablet extends StatelessWidget {
  const PocketTopContributorsTablet({super.key});

  static const double _avatar = 32;

  @override
  Widget build(BuildContext context) {
    final onContainer = context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.pocketDetailTopContributors.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(color: onContainer),
          ),
          const Gap.m(),
          for (var i = 0; i < kPocketTopContributors.length; i++) ...[
            if (i > 0) const Gap.m(),
            Row(
              children: [
                Text(
                  '${i + 1}',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: onContainer,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Gap.s(horizontal: true),
                CircleAvatar(
                  radius: _avatar / 2,
                  backgroundColor: context.colorScheme.primary,
                  child: Text(
                    kPocketTopContributors[i].name.characters.first,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Text(
                    kPocketTopContributors[i].name,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: onContainer,
                    ),
                  ),
                ),
                Text(
                  kPocketTopContributors[i].amount.formatShort(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: onContainer,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
