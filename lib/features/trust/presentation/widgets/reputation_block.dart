import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';
import 'package:keenpockets/features/trust/presentation/widgets/reputation_chip.dart';

/// The reputation hub block — a circular trust-score ring, the band pill, the
/// member identity, headline stats and recent ratings. Composed onto the
/// Profile and Trust pages and group headers (map §3).
class ReputationBlock extends StatelessWidget {
  const ReputationBlock({required this.trust, super.key});

  final TrustView trust;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(child: _ScoreRing(score: trust.score)),
        const Gap.s(),
        Center(child: _BandPill(band: trust.band)),
        if (trust.memberName != null) ...[
          const Gap.s(),
          Center(
            child: Text(
              trust.memberName!,
              style: context.textTheme.headlineMedium,
            ),
          ),
        ],
        if (trust.memberSince != null) ...[
          const Gap.xxs(),
          Center(
            child: Text(
              context.l10n.trustMemberSince(trust.memberSince!),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
        const Gap.l(),
        _StatCard(
          icon: Icons.verified_user_rounded,
          tint: context.colorScheme.primary,
          value: '${trust.paymentReliability}%',
          caption: context.l10n.trustReliability,
        ),
        const Gap.s(),
        _StatCard(
          icon: Icons.group_rounded,
          tint: context.colors.warning,
          value: '${trust.pocketsJoined}',
          caption: context.l10n.trustPocketsJoined,
        ),
        const Gap.s(),
        _StatCard(
          icon: Icons.rocket_launch_rounded,
          tint: context.colorScheme.error,
          value: '${trust.adashisCompleted}',
          caption: context.l10n.trustAdashisCompleted,
        ),
        const Gap.s(),
        _StatCard(
          icon: Icons.star_rounded,
          tint: context.colors.warning,
          value: trust.avgRating.toStringAsFixed(1),
          caption: context.l10n.trustAvgRating(trust.ratings.length),
        ),
        if (trust.kycVerified) ...[
          const Gap.l(),
          const Align(alignment: Alignment.centerLeft, child: KycBadge()),
        ],
        const Gap.l(),
        Text(
          context.l10n.trustRatingsTitle,
          style: context.textTheme.titleLarge,
        ),
        const Gap.s(),
        if (trust.ratings.isEmpty)
          Text(context.l10n.trustRatingsEmpty)
        else
          for (final r in trust.ratings) ...[
            _RatingCard(rating: r),
            const Gap.s(),
          ],
      ],
    );
  }
}

class _ScoreRing extends StatelessWidget {
  const _ScoreRing({required this.score});

  static const double _size = 160; // ring diameter (component dimension)

  final int score;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              value: (score / 100).clamp(0, 1),
              strokeWidth: KpSpacing.s,
              strokeCap: StrokeCap.round,
              backgroundColor: context.colorScheme.surfaceContainerHighest,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$score', style: context.textTheme.displayLarge),
              Text(
                context.l10n.trustScoreCaption,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BandPill extends StatelessWidget {
  const _BandPill({required this.band});

  final String band;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        band,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSecondary,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.tint,
    required this.value,
    required this.caption,
  });

  final IconData icon;
  final Color tint;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.xs),
            decoration: BoxDecoration(
              color: tint.withValues(alpha: 0.12),
              borderRadius: KpRadii.allM,
            ),
            child: Icon(icon, color: tint, size: KpSpacing.l),
          ),
          const Gap.m(horizontal: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: context.textTheme.titleLarge),
              Text(
                caption,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RatingCard extends StatelessWidget {
  const _RatingCard({required this.rating});

  final RatingView rating;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(rating.author, style: context.textTheme.titleMedium),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < 5; i++)
                    Icon(
                      i < rating.stars
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      size: KpSpacing.m,
                      color: context.colors.warning,
                    ),
                ],
              ),
            ],
          ),
          const Gap.xs(),
          Text(rating.comment, style: context.textTheme.bodyMedium),
          if (rating.context != null) ...[
            const Gap.xs(),
            Text(
              rating.context!,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
