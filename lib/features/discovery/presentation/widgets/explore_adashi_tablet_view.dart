import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/circle_rules_card.dart';
import 'package:keenpockets/features/discovery/presentation/widgets/explore_adashi_fixtures.dart';

/// Tablet/desktop layout for the public-circle detail (design
/// `explore_adashi_tablet`): an identity rail on the left and the circle's vital
/// stats + rules on the right.
class ExploreAdashiTabletView extends StatelessWidget {
  const ExploreAdashiTabletView({this.onJoin, super.key});

  final VoidCallback? onJoin;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _IdentityCard(onJoin: onJoin),
                  const Gap.l(),
                  const _MrKCard(),
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            const Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [_VitalStatsCard(), Gap.l(), CircleRulesCard()],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _IdentityCard extends StatelessWidget {
  const _IdentityCard({this.onJoin});

  static const double _avatarSize = 88;

  final VoidCallback? onJoin;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        children: [
          Container(
            width: _avatarSize,
            height: _avatarSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              borderRadius: KpRadii.allXl,
              border: Border.all(
                color: context.colorScheme.secondary,
                width: 4,
              ),
            ),
            child: const KpMascot(size: 64),
          ),
          const Gap.s(),
          Text(kCircleOrganiser, style: context.textTheme.headlineSmall),
          const Gap.xxs(),
          Text(
            context.l10n.exploreCircleOrganiser(kCircleName),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap.m(),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  value: kCircleRating,
                  label: context.l10n.exploreRatingLabel,
                ),
              ),
              Expanded(
                child: _MiniStat(
                  value: '$kCircleCirclesCount',
                  label: context.l10n.exploreCirclesLabel,
                ),
              ),
              Expanded(
                child: _MiniStat(
                  value: '$kCircleCompletion%',
                  label: context.l10n.exploreCompletionLabel,
                ),
              ),
            ],
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.exploreJoinCircle,
            icon: KpIcons.adashi,
            onPressed: onJoin ?? () {},
          ),
          const Gap.s(),
          Text(
            context.l10n.exploreLimitedSpots,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        Text(
          label.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _MrKCard extends StatelessWidget {
  const _MrKCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          const KpMascot(size: 56),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.exploreMrKSays,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSecondaryContainer,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  kCircleTestimonial,
                  style: context.textTheme.bodySmall?.copyWith(
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

class _VitalStatsCard extends StatelessWidget {
  const _VitalStatsCard();

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.exploreVitalStats,
            style: context.textTheme.titleLarge,
          ),
          const Gap.m(),
          Row(
            children: [
              Expanded(
                child: _VitalBox(
                  tint: context.colorScheme.primary,
                  value: context.l10n.exploreMembersOfCapacity(
                    kCircleMembers,
                    kCircleCapacity,
                  ),
                  label: context.l10n.exploreMembersLabel,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: _VitalBox(
                  tint: context.colorScheme.secondary,
                  value: kCirclePerCycle.formatShort(),
                  label: context.l10n.explorePerCycleLabel,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: _VitalBox(
                  tint: context.colorScheme.error,
                  value: context.l10n.exploreDaysValue(kCircleCycleDays),
                  label: context.l10n.exploreCycleLengthLabel,
                ),
              ),
            ],
          ),
          const Gap.l(),
          Text(
            context.l10n.exploreNextPayout,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xs(),
          const KpProgressBar(value: kCircleNextPayoutProgress),
        ],
      ),
    );
  }
}

class _VitalBox extends StatelessWidget {
  const _VitalBox({
    required this.tint,
    required this.value,
    required this.label,
  });

  final Color tint;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        children: [
          Text(
            value,
            style: context.textTheme.titleLarge?.copyWith(color: tint),
          ),
          const Gap.xxs(),
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
