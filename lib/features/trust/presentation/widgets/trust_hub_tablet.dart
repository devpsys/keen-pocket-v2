import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';
import 'package:keenpockets/features/trust/presentation/widgets/trust_fixtures.dart';

/// Tablet "Reputation Hub" (design `reputation_trust_hub_tablet`): header tabs,
/// a semicircular gauge hero, reliability stats, mascot, ratings feed and the
/// top-trust-factors panel.
class TrustHubTablet extends StatelessWidget {
  const TrustHubTablet({required this.trust, super.key});

  final TrustView trust;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const _HubHeader(),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(KpSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _HubHero(trust: trust),
                  const Gap.l(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const _ReliabilityCard(),
                            const Gap.l(),
                            _HubMascotCard(name: trust.memberName ?? ''),
                          ],
                        ),
                      ),
                      const Gap.l(horizontal: true),
                      Expanded(
                        flex: 7,
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
                            for (final r in kTrustHubRatings) ...[
                              _HubRatingCard(rating: r),
                              const Gap.m(),
                            ],
                            const _TopFactorsCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// White hub card (2px outline + 7px drop shadow — design `card-shadow`).
class _HubCard extends StatelessWidget {
  const _HubCard({required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.surfaceContainerHighest,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _HubHeader extends StatelessWidget {
  const _HubHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.l,
        vertical: KpSpacing.m,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            context.l10n.trustHubTitle,
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.xl(horizontal: true),
          _tab(context, context.l10n.trustHubTabOverview, active: false),
          const Gap.l(horizontal: true),
          _tab(context, context.l10n.trustHubTabHistory, active: false),
          const Gap.l(horizontal: true),
          _tab(context, context.l10n.trustHubTabAnalytics, active: true),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              KpIcons.notificationsOutlined,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(BuildContext context, String label, {required bool active}) {
    return Container(
      padding: const EdgeInsets.only(bottom: KpSpacing.xxs),
      decoration: active
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.primary,
                  width: 4,
                ),
              ),
            )
          : null,
      child: Text(
        label,
        style: context.textTheme.labelLarge?.copyWith(
          color: active
              ? context.colorScheme.primary
              : context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _HubHero extends StatelessWidget {
  const _HubHero({required this.trust});

  final TrustView trust;

  @override
  Widget build(BuildContext context) {
    return _HubCard(
      padding: const EdgeInsets.all(KpSpacing.xl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const _HalfGauge(value: 0.94, label: kTrustHubGauge),
              const Gap.s(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.m,
                  vertical: KpSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer.withValues(
                    alpha: 0.2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(KpRadii.pill),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      size: KpSpacing.l,
                      color: context.colorScheme.primary,
                    ),
                    const Gap.xs(horizontal: true),
                    Text(
                      context.l10n.trustTopReliablePayer,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.xl(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.trustExcellentStanding,
                  style: context.textTheme.headlineMedium,
                ),
                const Gap.xs(),
                Text(
                  context.l10n.trustStandingBody(trust.memberName ?? ''),
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap.l(),
                Row(
                  children: [
                    Flexible(
                      child: KpButton(
                        label: context.l10n.trustVouchFor(
                          trust.memberName ?? '',
                        ),
                        icon: Icons.verified_rounded,
                        onPressed: () {},
                      ),
                    ),
                    const Gap.s(horizontal: true),
                    Flexible(
                      child: KpButton(
                        label: context.l10n.trustInviteToGroup,
                        variant: KpButtonVariant.ghost,
                        icon: Icons.person_add_rounded,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Semicircular trust-score gauge (design `gauge`).
class _HalfGauge extends StatelessWidget {
  const _HalfGauge({required this.value, required this.label});

  final double value; // 0..1
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 140,
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: const Size(240, 120),
            painter: _GaugePainter(
              value: value,
              track: context.colorScheme.surfaceContainer,
              fill: context.colorScheme.primaryContainer,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: KpSpacing.xs),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  context.l10n.trustScoreCaption.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    letterSpacing: 1.5,
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

class _GaugePainter extends CustomPainter {
  const _GaugePainter({
    required this.value,
    required this.track,
    required this.fill,
  });

  final double value;
  final Color track;
  final Color fill;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 22.0;
    final rect = Rect.fromLTWH(
      stroke / 2,
      stroke / 2,
      size.width - stroke,
      (size.height - stroke / 2) * 2,
    );
    final base = Paint()
      ..color = track
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    final progress = Paint()
      ..color = fill
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, math.pi, math.pi, false, base);
    canvas.drawArc(rect, math.pi, math.pi * value.clamp(0, 1), false, progress);
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.value != value || old.track != track || old.fill != fill;
}

class _ReliabilityCard extends StatelessWidget {
  const _ReliabilityCard();

  @override
  Widget build(BuildContext context) {
    return _HubCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_rounded,
                color: context.colorScheme.secondary,
              ),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.trustReliabilityStats,
                  style: context.textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const Gap.l(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  context.l10n.trustPaymentConsistency,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              Text(
                '${(kTrustHubConsistency * 100).toStringAsFixed(1)}%',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.s(),
          const KpProgressBar(value: kTrustHubConsistency, height: 16),
          const Gap.l(),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  value: '$kTrustHubGroupsJoined',
                  label: context.l10n.trustGroupsJoined,
                  tint: context.colorScheme.primary,
                ),
              ),
              const Gap.m(horizontal: true),
              Expanded(
                child: _MiniStat(
                  value: '$kTrustHubCompleted',
                  label: context.l10n.trustCompleted,
                  tint: context.colorScheme.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
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
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        children: [
          Text(
            value,
            style: context.textTheme.headlineSmall?.copyWith(color: tint),
          ),
          const Gap.xxs(),
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

class _HubMascotCard extends StatelessWidget {
  const _HubMascotCard({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: context.colorScheme.primaryContainer.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KpMascot.celebrate(size: 56),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.trustMascotSays,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.trustHubMascotBody(name),
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

class _HubRatingCard extends StatelessWidget {
  const _HubRatingCard({required this.rating});

  final TrustHubRating rating;

  @override
  Widget build(BuildContext context) {
    return _HubCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KpNetworkAvatar(url: rating.avatarUrl, radius: KpSpacing.l),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rating.author,
                            style: context.textTheme.labelLarge,
                          ),
                          Text(
                            rating.group,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap.s(horizontal: true),
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
                const Gap.s(),
                Text(
                  rating.comment,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (rating.tags.isNotEmpty) ...[
                  const Gap.s(),
                  Wrap(
                    spacing: KpSpacing.xs,
                    runSpacing: KpSpacing.xs,
                    children: [
                      for (final tag in rating.tags) _TagChip(label: tag),
                    ],
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

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allS,
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _TopFactorsCard extends StatelessWidget {
  const _TopFactorsCard();

  @override
  Widget build(BuildContext context) {
    final factors = [
      TrustFactor(
        icon: Icons.schedule_rounded,
        label: context.l10n.trustFactorEarlyPayer,
      ),
      TrustFactor(
        icon: Icons.handshake_rounded,
        label: context.l10n.trustFactorVouches,
      ),
      TrustFactor(icon: Icons.lock_rounded, label: context.l10n.trustFactorKyc),
      TrustFactor(
        icon: Icons.trending_up_rounded,
        label: context.l10n.trustFactorTenure,
      ),
    ];
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: KpColors.gold500.withValues(alpha: 0.06),
        borderRadius: KpRadii.allXl,
        border: Border.all(
          color: KpColors.gold500.withValues(alpha: 0.2),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.trustTopFactors.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: KpColors.gold600,
              letterSpacing: 0.5,
            ),
          ),
          const Gap.m(),
          for (var i = 0; i < factors.length; i += 2) ...[
            if (i > 0) const Gap.m(),
            Row(
              children: [
                Expanded(child: _FactorTile(factor: factors[i])),
                const Gap.m(horizontal: true),
                Expanded(child: _FactorTile(factor: factors[i + 1])),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _FactorTile extends StatelessWidget {
  const _FactorTile({required this.factor});

  final TrustFactor factor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(KpSpacing.xs),
          decoration: BoxDecoration(
            color: KpColors.gold500.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            factor.icon,
            size: KpSpacing.m,
            color: context.colorScheme.secondary,
          ),
        ),
        const Gap.s(horizontal: true),
        Flexible(
          child: Text(
            factor.label,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
