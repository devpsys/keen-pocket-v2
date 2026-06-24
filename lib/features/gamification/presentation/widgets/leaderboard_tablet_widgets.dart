import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/leaderboard_state.dart';
import 'package:keenpockets/features/gamification/presentation/view_models/leaderboard_view.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/leaderboard_widgets.dart'
    show PodiumCrown;

/// Group digits with thousands separators ("1240" → "1,240"). Presentation-only.
String _grouped(int value) {
  final s = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i != 0 && (s.length - i) % 3 == 0) buffer.write(',');
    buffer.write(s[i]);
  }
  return buffer.toString();
}

BoxDecoration _card(BuildContext context) => BoxDecoration(
  color: context.colorScheme.surface,
  borderRadius: KpRadii.allXl,
  boxShadow: [
    BoxShadow(
      color: context.colorScheme.surfaceContainerHighest,
      offset: const Offset(0, 7),
    ),
  ],
);

/// Tablet leaderboard dashboard (design `leaderboard_rankings_tablet`): a podium
/// + "recently climbed" main column and a standing/stats/referral rail. The nav
/// rail is provided by `AppTabletShell`. Presentation-only.
class LeaderboardTabletView extends StatelessWidget {
  const LeaderboardTabletView({required this.state, this.onScope, super.key});

  final LeaderboardState state;
  final ValueChanged<LeaderboardScope>? onScope;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main column ~2/3, the standing rail ~1/3 (design
            // `leaderboard_rankings_tablet`), so both reflow with the width.
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(KpSpacing.xl),
                    decoration: _card(context),
                    child: _TabletPodium(podium: state.podium),
                  ),
                  const Gap.l(),
                  _RecentlyClimbed(rows: state.rows),
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  if (state.standing != null)
                    _StandingCard(standing: state.standing!),
                  const Gap.l(),
                  if (state.standing != null)
                    _StatRow(standing: state.standing!),
                  const Gap.l(),
                  const _ReferralCard(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Tablet podium (design `leaderboard_rankings_tablet`): avatars with name and
/// points above a row of rounded "step" cards — the centre highlighted with a
/// trophy, the sides grey with medal/star icons.
class _TabletPodium extends StatelessWidget {
  const _TabletPodium({required this.podium});

  final List<PodiumEntry> podium;

  PodiumEntry? _byRank(int rank) =>
      podium.where((p) => p.rank == rank).firstOrNull;

  @override
  Widget build(BuildContext context) {
    final first = _byRank(1);
    final second = _byRank(2);
    final third = _byRank(3);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (second != null)
          Expanded(
            child: _TabletPodiumColumn(
              entry: second,
              stepHeight: 110,
              stepIcon: Icons.workspace_premium_outlined,
            ),
          ),
        const Gap.xl(horizontal: true),
        if (first != null)
          Expanded(
            child: _TabletPodiumColumn(
              entry: first,
              stepHeight: 150,
              stepIcon: Icons.emoji_events_rounded,
              highlighted: true,
            ),
          ),
        const Gap.xl(horizontal: true),
        if (third != null)
          Expanded(
            child: _TabletPodiumColumn(
              entry: third,
              stepHeight: 92,
              stepIcon: Icons.star_outline_outlined,
            ),
          ),
      ],
    );
  }
}

class _TabletPodiumColumn extends StatelessWidget {
  const _TabletPodiumColumn({
    required this.entry,
    required this.stepHeight,
    required this.stepIcon,
    this.highlighted = false,
  });

  final PodiumEntry entry;
  final double stepHeight;
  final IconData stepIcon;
  final bool highlighted;

  static const double _avatarFirst = 88;
  static const double _avatarOther = 68;
  static const double _zoneFirst = 116;
  static const double _zoneOther = 96;

  @override
  Widget build(BuildContext context) {
    final first = entry.rank == 1;
    final (Color ring, Color onRing) = switch (entry.rank) {
      1 => (
        context.colorScheme.secondaryContainer,
        context.colorScheme.onSecondaryContainer,
      ),
      2 => (context.colorScheme.outline, context.colorScheme.onPrimary),
      _ => (
        context.colorScheme.tertiaryContainer,
        context.colorScheme.onPrimary,
      ),
    };
    final avatar = first ? _avatarFirst : _avatarOther;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: first ? _zoneFirst : _zoneOther,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              if (first)
                const Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: PodiumCrown(),
                  ),
                ),
              SizedBox(
                width: avatar,
                height: avatar,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: avatar,
                      height: avatar,
                      padding: const EdgeInsets.all(KpSpacing.xxs),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ring,
                      ),
                      child: KpNetworkAvatar(
                        url: entry.avatarUrl,
                        radius: avatar / 2 - KpSpacing.xxs,
                      ),
                    ),
                    // Rank badge at ~4:30 (bottom-right), not 6 o'clock.
                    Positioned(
                      right: 0,
                      bottom: KpSpacing.xxs,
                      child: Container(
                        width: KpSpacing.l,
                        height: KpSpacing.l,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ring,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colorScheme.surface,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '${entry.rank}',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: onRing,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Gap.s(),
        Text(
          entry.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: first
              ? context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w800,
                )
              : context.textTheme.titleMedium?.copyWith(
                  color: null,
                  fontWeight: FontWeight.w400,
                ),
        ),
        const Gap.xxs(),
        Text(
          context.l10n.leaderboardPoints(entry.points),
          style: context.textTheme.labelLarge?.copyWith(
            color: first
                ? context.colorScheme.primary
                : context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Gap.m(),
        Container(
          height: stepHeight,
          width: double.infinity,
          // Slimmer stands than the full column width.
          margin: const EdgeInsets.symmetric(horizontal: KpSpacing.s),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: highlighted
                ? context.colorScheme.primaryContainer
                : context.colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.vertical(top: KpRadii.radiusL),
            // #1: thin top/side border, no bottom (the shadow reads as depth).
            border: highlighted
                ? Border(
                    top: BorderSide(color: context.colorScheme.primary),
                    left: BorderSide(color: context.colorScheme.primary),
                    right: BorderSide(color: context.colorScheme.primary),
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.outlineVariant,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            stepIcon,
            size: KpSpacing.xl,
            color: highlighted
                ? context.colorScheme.primary
                : context.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}

class _RecentlyClimbed extends StatelessWidget {
  const _RecentlyClimbed({required this.rows});

  final List<LeaderboardEntry> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _card(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.leaderboardRecentlyClimbed.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
          const Gap.m(),
          for (var i = 0; i < rows.length; i++) ...[
            if (i != 0) const Divider(height: 1),
            _Row(entry: rows[i]),
          ],
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.entry});

  final LeaderboardEntry entry;

  @override
  Widget build(BuildContext context) {
    final (IconData icon, Color color) = switch (entry.trend) {
      LeaderboardTrend.up => (
        Icons.trending_up_rounded,
        context.colors.success,
      ),
      LeaderboardTrend.down => (
        Icons.trending_down_rounded,
        context.colorScheme.error,
      ),
      LeaderboardTrend.flat => (
        Icons.trending_flat_rounded,
        context.colorScheme.outline,
      ),
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
      child: Row(
        children: [
          SizedBox(
            width: KpSpacing.l,
            child: Text(
              '${entry.rank}',
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Gap.s(horizontal: true),
          KpNetworkAvatar(url: entry.avatarUrl, radius: KpSpacing.m),
          const Gap.m(horizontal: true),
          Expanded(
            child: Text(
              entry.name,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            context.l10n.leaderboardPoints(entry.points),
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.s(horizontal: true),
          Icon(icon, color: color, size: KpSpacing.l),
        ],
      ),
    );
  }
}

class _StandingCard extends StatelessWidget {
  const _StandingCard({required this.standing});

  final LeaderboardStanding standing;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onPrimaryContainer,
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  context.l10n.leaderboardYourStanding.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: onPrimary.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(KpSpacing.xs),
                decoration: BoxDecoration(
                  color: onPrimary.withValues(alpha: 0.2),
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(
                  Icons.trending_up_rounded,
                  color: onPrimary,
                  size: KpSpacing.l,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          Text(
            '#${standing.rank}',
            style: context.textTheme.displaySmall?.copyWith(
              color: onPrimary,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            standing.percentile,
            style: context.textTheme.bodyMedium?.copyWith(
              color: onPrimary.withValues(alpha: 0.9),
            ),
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.m),
            decoration: BoxDecoration(
              color: onPrimary.withValues(alpha: 0.15),
              borderRadius: KpRadii.allL,
            ),
            child: Row(
              children: [
                Icon(Icons.bolt_rounded, color: onPrimary, size: KpSpacing.l),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.leaderboardFocusMode,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: onPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Gap.xxs(),
                      Text(
                        context.l10n.leaderboardFocusModeDesc,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: onPrimary.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(value: standing.focusMode, onChanged: (_) {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.standing});

  final LeaderboardStanding standing;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.stars_rounded,
              label: context.l10n.leaderboardPointsEarned,
              value: _grouped(standing.pointsEarned),
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: _StatCard(
              icon: Icons.volunteer_activism_rounded,
              label: context.l10n.leaderboardContributions,
              value: '${standing.totalContributions}',
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: _card(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: context.colorScheme.primary),
          const Gap.s(),
          Text(
            value,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReferralCard extends StatelessWidget {
  const _ReferralCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [KpColors.gold100, KpColors.gold500],
        ),
        borderRadius: KpRadii.allXl,
        boxShadow: [BoxShadow(color: KpColors.gold600, offset: Offset(0, 7))],
      ),
      child: Column(
        children: [
          Container(
            width: KpSpacing.xxxl,
            height: KpSpacing.xxxl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: KpColors.gold500,
              shape: BoxShape.circle,
              border: Border.all(color: KpColors.gold600, width: 3),
            ),
            child: Text(
              context.l10n.leaderboardKeensCoin,
              style: context.textTheme.headlineMedium?.copyWith(
                color: KpColors.gold600,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Gap.m(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.m,
              vertical: KpSpacing.s,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(KpRadii.pill),
              ),
            ),
            child: Text(
              context.l10n.leaderboardReferKeens,
              textAlign: TextAlign.center,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: KpColors.gold600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
