import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';
import 'package:keenpockets/features/trust/trust.dart';

/// Gradient hero banner + overlapping identity card heading the pocket detail
/// hub: status pill, pocket name, hand/duration, rating, and the organiser row
/// with rate-admin and share actions.
class PocketHeaderCard extends StatelessWidget {
  const PocketHeaderCard({required this.pocket, required this.role, super.key});

  static const double _bannerHeight = 96;
  static const double _bodyOverlap = -40;
  static const double _avatarSize = 48;

  final Pocket pocket;
  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: KpRadii.allXl,
      child: Container(
        color: context.colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Vibrant candy gradient hero.
            Container(
              height: _bannerHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary,
                    context.colorScheme.secondaryContainer,
                  ],
                ),
              ),
            ),
            // White body overlapping the banner.
            Transform.translate(
              offset: const Offset(0, _bodyOverlap),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  KpSpacing.m,
                  KpSpacing.none,
                  KpSpacing.m,
                  KpSpacing.none,
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
                              _StatusPill(label: context.l10n.pocketStatusOpen),
                              const Gap.xs(),
                              Text(
                                pocket.name,
                                style: context.textTheme.headlineMedium,
                              ),
                              const Gap.xxs(),
                              Text(
                                context.l10n.pocketDetailHandDuration(
                                  pocket.handPrice.format(),
                                ),
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap.s(horizontal: true),
                        const _RatingChip(),
                      ],
                    ),
                    const Gap.m(),
                    _OrganiserRow(role: role),
                    const Gap.m(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Gold "OPEN" status pill in the header.
class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

/// Reputation chip showing the pocket's star rating.
class _RatingChip extends StatelessWidget {
  const _RatingChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(KpIcons.medal, color: context.colorScheme.primary),
          const Gap.xxs(horizontal: true),
          Text(kPocketRating, style: context.textTheme.labelLarge),
        ],
      ),
    );
  }
}

/// Organiser identity row with avatar, verified badge, and the rate-admin /
/// share actions.
class _OrganiserRow extends StatelessWidget {
  const _OrganiserRow({required this.role});

  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: PocketHeaderCard._avatarSize / 2,
              backgroundColor: context.colorScheme.primaryContainer,
              child: Icon(
                KpIcons.profile,
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          kPocketOrganiserName,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      const Gap.xxs(horizontal: true),
                      Icon(
                        KpIcons.verified,
                        size: KpSpacing.m,
                        color: context.colorScheme.primary,
                      ),
                      const Gap.xxs(horizontal: true),
                      Text(
                        context.l10n.pocketDetailVerified,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    context.l10n.pocketOrganiser,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap.s(),
        Row(
          children: [
            Expanded(
              child: KpButton(
                label: context.l10n.pocketDetailRateAdmin,
                icon: KpIcons.medal,
                variant: KpButtonVariant.ghost,
                onPressed: () => RateOrganiserSheet.show(
                  context,
                  organiserName: kPocketOrganiserName,
                ),
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: KpButton(
                label: context.l10n.pocketDetailShare,
                icon: Icons.share_rounded,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
