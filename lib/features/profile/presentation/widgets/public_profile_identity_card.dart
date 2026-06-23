import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_fixtures.dart';

/// Tablet identity card (design `public_profile_tablet`): a circular portrait
/// with a Verified badge, name + "(you)", subtitle, a Rating / Groups / Trust
/// stat grid, a Trust-score ring, and reputation badge chips — inside a KpCard.
class PublicProfileIdentityCard extends StatelessWidget {
  const PublicProfileIdentityCard({super.key});

  static const double _avatarRadius = 56;
  static const double _ring = 120;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: const EdgeInsets.all(KpSpacing.xs),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.primaryContainer,
                  ),
                  child: const KpNetworkAvatar(
                    url: kPublicAvatarUrl,
                    radius: _avatarRadius,
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
                            fontWeight: FontWeight.w500,
                            color: context.colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                kPublicName,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.publicProfileYou,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.xxs(),
          Text(
            kPublicSubtitle,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
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
          const Gap.xl(),
          Center(
            child: SizedBox(
              width: _ring,
              height: _ring,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: CircularProgressIndicator(
                      value: kPublicTrustValue,
                      strokeWidth: KpSpacing.s,
                      strokeCap: StrokeCap.round,
                      backgroundColor:
                          context.colorScheme.surfaceContainerHighest,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        kPublicTrust,
                        style: context.textTheme.displaySmall?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        context.l10n.profileTrustScore.toUpperCase(),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Gap.l(),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: KpSpacing.s,
            runSpacing: KpSpacing.s,
            children: [
              for (var i = 0; i < kPublicBadges.length; i++)
                _BadgeChip(
                  label: kPublicBadges[i],
                  tint: i == 0
                      ? context.colorScheme.primary
                      : context.colorScheme.secondary,
                ),
            ],
          ),
        ],
      ),
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
            style: context.textTheme.bodyLarge?.copyWith(
              color: tint,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.label, required this.tint});

  final String label;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: tint.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(KpRadii.pill),
        border: Border.all(color: tint.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: context.textTheme.labelMedium?.copyWith(color: tint),
      ),
    );
  }
}
