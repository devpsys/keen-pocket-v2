import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_fixtures.dart';

/// Identity block: portrait with a Verified badge, name + "(you)", subtitle, and
/// a Rating / Groups / Trust stat grid (design `public_profile`).
class PublicProfileIdentity extends StatelessWidget {
  const PublicProfileIdentity({super.key});

  static const double _avatar = 96;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: _avatar,
              height: _avatar,
              padding: const EdgeInsets.all(KpSpacing.xxs),
              decoration: BoxDecoration(
                borderRadius: KpRadii.allXl,
                border: Border.all(
                  color: context.colorScheme.primary,
                  width: 4,
                ),
              ),
              child: const KpNetworkImage(
                url: kPublicAvatarUrl,
                width: _avatar,
                height: _avatar,
                borderRadius: KpRadii.allL,
              ),
            ),
            Positioned(
              bottom: -KpSpacing.xs,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.s,
                  vertical: KpSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(KpRadii.pill),
                  border: Border.all(
                    color: context.colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      size: KpSpacing.m,
                      color: context.colorScheme.onSecondaryContainer,
                    ),
                    const Gap.xxs(horizontal: true),
                    Text(
                      context.l10n.publicProfileVerified,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const Gap.m(),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(kPublicName, style: context.textTheme.headlineMedium),
            const Gap.xs(horizontal: true),
            Text(
              context.l10n.publicProfileYou,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const Gap.xxs(),
        Text(
          kPublicSubtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.l(),
        Row(
          children: [
            Expanded(
              child: _StatTile(
                value: kPublicRating,
                label: context.l10n.publicProfileRating,
                tint: context.colorScheme.primary,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: _StatTile(
                value: kPublicGroupsCount,
                label: context.l10n.publicProfileGroups,
                tint: context.colorScheme.secondary,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: _StatTile(
                value: kPublicTrust,
                label: context.l10n.publicProfileTrust,
                tint: context.colorScheme.error,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.value,
    required this.label,
    required this.tint,
  });

  final String value;
  final String label;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allL,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: context.textTheme.headlineSmall?.copyWith(color: tint),
          ),
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
