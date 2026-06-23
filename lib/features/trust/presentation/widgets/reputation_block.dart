import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';

/// Reputation hub block (design `reputation_trust_score`): the score-ring hero
/// with its overlapping band badge, a four-stat bento, and the recent-ratings
/// panel with Mr K's insight. Composed onto the Trust page.
class ReputationBlock extends StatelessWidget {
  const ReputationBlock({required this.trust, super.key});

  final TrustView trust;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TrustScoreHero(trust: trust),
        const Gap.xl(),
        TrustStatCard(
          icon: Icons.verified_user_rounded,
          box: KpColors.brand100,
          tint: context.colorScheme.primary,
          value: '${trust.paymentReliability}%',
          caption: context.l10n.trustReliability,
        ),
        const Gap.m(),
        TrustStatCard(
          icon: Icons.group_rounded,
          box: KpColors.gold100,
          tint: KpColors.gold600,
          value: '${trust.pocketsJoined}',
          caption: context.l10n.trustPocketsJoined,
        ),
        const Gap.m(),
        TrustStatCard(
          icon: Icons.rocket_launch_rounded,
          box: KpColors.tertiary100,
          tint: KpColors.tertiary500,
          value: '${trust.adashisCompleted}',
          caption: context.l10n.trustAdashisCompleted,
        ),
        const Gap.m(),
        TrustStatCard(
          icon: Icons.star_rounded,
          box: context.colorScheme.primaryContainer,
          tint: context.colorScheme.onPrimaryContainer,
          value: trust.avgRating.toStringAsFixed(1),
          caption: context.l10n.trustAvgRating(trust.ratings.length),
        ),
        const Gap.xl(),
        _RatingsPanel(trust: trust),
      ],
    );
  }
}

/// The circular trust-score ring with its overlapping band badge, name and
/// member line.
class TrustScoreHero extends StatelessWidget {
  const TrustScoreHero({required this.trust, super.key});

  static const double _ring = 150;

  final TrustView trust;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: _ring,
          height: _ring,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: CircularProgressIndicator(
                  value: (trust.score / 100).clamp(0, 1),
                  strokeWidth: KpSpacing.s,
                  strokeCap: StrokeCap.round,
                  backgroundColor: context.colorScheme.surfaceContainerHighest,
                ),
              ),
              Column(
                mainAxisSize: .min,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    '${trust.score}',
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    context.l10n.trustScoreCaption.toUpperCase(),
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -KpSpacing.m,
                child: _BandBadge(band: trust.band),
              ),
            ],
          ),
        ),
        const Gap.xl(),
        Text(trust.memberName ?? '', style: context.textTheme.headlineMedium),
        if (trust.memberSince != null) ...[
          const Gap.xxs(),
          Text(
            context.l10n.trustMemberLine(
              trust.memberSince!,
              trust.rank ?? context.l10n.trustTopContributor,
            ),
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

class _BandBadge extends StatelessWidget {
  const _BandBadge({required this.band});

  final String band;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.l,
        vertical: KpSpacing.xs,
      ),
      decoration: const BoxDecoration(
        color: KpColors.gold500,
        borderRadius: BorderRadius.all(Radius.circular(KpRadii.pill)),
        border: Border(bottom: BorderSide(color: KpColors.gold600, width: 4)),
      ),
      child: Text(
        band.toUpperCase(),
        style: context.textTheme.labelMedium?.copyWith(color: KpColors.gold600),
      ),
    );
  }
}

/// A centered headline stat (icon tile + value + caption) — design `stat-card`.
class TrustStatCard extends StatelessWidget {
  const TrustStatCard({
    required this.icon,
    required this.box,
    required this.tint,
    required this.value,
    required this.caption,
    super.key,
  });

  final IconData icon;
  final Color box;
  final Color tint;
  final String value;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allL,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(color: box, borderRadius: KpRadii.allS),
            child: Icon(icon, color: tint),
          ),
          const Gap.s(),
          Text(
            value,
            style: context.textTheme.headlineSmall?.copyWith(color: tint),
          ),
          const Gap.xxs(),
          Text(
            caption,
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingsPanel extends StatelessWidget {
  const _RatingsPanel({required this.trust});

  final TrustView trust;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.trustRecentRatings,
                style: context.textTheme.titleLarge,
              ),
              Text(
                context.l10n.trustViewAll,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.m(),
          if (trust.ratings.isEmpty)
            Text(context.l10n.trustRatingsEmpty)
          else
            for (final r in trust.ratings) ...[
              TrustRatingCard(rating: r),
              const Gap.s(),
            ],
          const Gap.s(),
          _MascotInsight(name: trust.memberName ?? ''),
        ],
      ),
    );
  }
}

/// One recent rating: rater avatar, name, stars, comment and context label.
class TrustRatingCard extends StatelessWidget {
  const TrustRatingCard({required this.rating, super.key});

  final RatingView rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allL,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (rating.avatarUrl != null) ...[
            KpNetworkAvatar(url: rating.avatarUrl!, radius: KpSpacing.l),
            const Gap.s(horizontal: true),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        rating.author,
                        style: context.textTheme.labelLarge,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < 5; i++)
                          Icon(
                            i < rating.stars
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            size: KpSpacing.m,
                            color: KpColors.gold500,
                          ),
                      ],
                    ),
                  ],
                ),
                const Gap.xxs(),
                Text(
                  rating.comment,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (rating.context != null) ...[
                  const Gap.xs(),
                  Text(
                    rating.context!,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.primary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Mr K insight (dashed brand card) under the ratings.
class _MascotInsight extends StatelessWidget {
  const _MascotInsight({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashedRRectPainter(
        color: context.colorScheme.primaryContainer,
      ),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.m),
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
          borderRadius: KpRadii.allXl,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(KpSpacing.s),
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.emoji_objects_rounded,
                color: context.colorScheme.onPrimary,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.trustMascotSays,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.trustMascotInsight(name),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
