import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/gamification/presentation/cubit/leaderboard_state.dart';
import 'package:keenpockets/features/gamification/presentation/view_models/leaderboard_view.dart';

/// The bouncing crown above the first-place avatar (design `leaderboard_rankings`
/// uses `animate-bounce`). Shared by the phone and tablet podiums.
class PodiumCrown extends StatefulWidget {
  const PodiumCrown({super.key});

  @override
  State<PodiumCrown> createState() => _PodiumCrownState();
}

class _PodiumCrownState extends State<PodiumCrown>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat(reverse: true);

  late final Animation<Offset> _bounce = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -0.3),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _bounce,
      child: Icon(
        Icons.workspace_premium_rounded,
        color: context.colorScheme.secondaryContainer,
        size: KpSpacing.xl,
      ),
    );
  }
}

/// Segmented "This week / All time" scope toggle (design `leaderboard_rankings`).
class LeaderboardScopeToggle extends StatelessWidget {
  const LeaderboardScopeToggle({required this.scope, this.onScope, super.key});

  final LeaderboardScope scope;
  final ValueChanged<LeaderboardScope>? onScope;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.surfaceContainerHighest,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.xxs),
        child: Row(
          children: [
            _ScopeSegment(
              label: context.l10n.leaderboardScopeWeek,
              selected: scope == LeaderboardScope.thisWeek,
              onTap: () => onScope?.call(LeaderboardScope.thisWeek),
            ),
            _ScopeSegment(
              label: context.l10n.leaderboardScopeAllTime,
              selected: scope == LeaderboardScope.allTime,
              onTap: () => onScope?.call(LeaderboardScope.allTime),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScopeSegment extends StatelessWidget {
  const _ScopeSegment({
    required this.label,
    required this.selected,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: selected ? context.colorScheme.primary : KpColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: selected
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The top-3 podium (design `leaderboard_rankings`). Expects the podium sorted
/// by rank (1, 2, 3) and lays them out as 2 · 1 · 3.
class LeaderboardPodium extends StatelessWidget {
  const LeaderboardPodium({required this.podium, super.key});

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
          Expanded(child: _PodiumColumn(entry: second, barHeight: 84)),
        const Gap.xs(horizontal: true),
        if (first != null)
          Expanded(child: _PodiumColumn(entry: first, barHeight: 124)),
        const Gap.xs(horizontal: true),
        if (third != null)
          Expanded(child: _PodiumColumn(entry: third, barHeight: 64)),
      ],
    );
  }
}

class _PodiumColumn extends StatelessWidget {
  const _PodiumColumn({required this.entry, required this.barHeight});

  final PodiumEntry entry;
  final double barHeight;

  static const double _avatarFirst = 84;
  static const double _avatarOther = 68;
  static const double _zoneFirst = 112;
  static const double _zoneOther = 92;

  @override
  Widget build(BuildContext context) {
    final first = entry.rank == 1;
    final (Color bar, Color onBar) = switch (entry.rank) {
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
              Container(
                width: avatar,
                height: avatar,
                padding: const EdgeInsets.all(KpSpacing.xxs),
                decoration: BoxDecoration(shape: BoxShape.circle, color: bar),
                child: KpNetworkAvatar(
                  url: entry.avatarUrl,
                  radius: avatar / 2,
                ),
              ),
              Positioned(
                bottom: -KpSpacing.xs,
                child: Container(
                  width: KpSpacing.l,
                  height: KpSpacing.l,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: bar,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.colorScheme.surface,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    '${entry.rank}',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: onBar,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap.xs(),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: barHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.xs,
            vertical: KpSpacing.s,
          ),
          decoration: BoxDecoration(
            color: bar,
            borderRadius: const BorderRadius.vertical(top: KpRadii.radiusL),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                entry.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelLarge?.copyWith(
                  color: onBar,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap.xxs(),
              Text(
                context.l10n.leaderboardPoints(entry.points),
                style: context.textTheme.titleMedium?.copyWith(
                  color: onBar,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A ranked list row below the podium.
class LeaderboardRankRow extends StatelessWidget {
  const LeaderboardRankRow({
    required this.entry,
    this.showTrend = false,
    super.key,
  });

  final LeaderboardEntry entry;
  final bool showTrend;

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
        children: [
          SizedBox(
            width: KpSpacing.l,
            child: Text(
              '${entry.rank}',
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.outline,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Gap.s(horizontal: true),
          KpNetworkAvatar(url: entry.avatarUrl, radius: KpSpacing.l),
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
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (showTrend) ...[
            const Gap.s(horizontal: true),
            _TrendIcon(trend: entry.trend),
          ],
        ],
      ),
    );
  }
}

class _TrendIcon extends StatelessWidget {
  const _TrendIcon({required this.trend});

  final LeaderboardTrend trend;

  @override
  Widget build(BuildContext context) {
    final (IconData icon, Color color) = switch (trend) {
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
    return Icon(icon, color: color, size: KpSpacing.l);
  }
}

/// Sticky "your rank" card pinned to the bottom on phone.
class LeaderboardStandingCard extends StatelessWidget {
  const LeaderboardStandingCard({required this.standing, super.key});

  final LeaderboardStanding standing;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      margin: const EdgeInsets.all(KpSpacing.m),
      padding: const EdgeInsets.all(KpSpacing.m),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.xxs),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: onPrimary, width: 2),
            ),
            child: KpNetworkAvatar(
              url: standing.avatarUrl,
              radius: KpSpacing.m,
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.leaderboardYourRank(standing.rank),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  context.l10n.leaderboardContributionsCount(
                    standing.contributions,
                  ),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: onPrimary.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
          if (standing.focusMode)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: KpSpacing.s,
                vertical: KpSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: onPrimary.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(KpRadii.pill),
                ),
              ),
              child: Text(
                context.l10n.leaderboardFocusMode.toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: onPrimary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          const Gap.s(horizontal: true),
          Icon(Icons.trending_up_rounded, color: onPrimary),
        ],
      ),
    );
  }
}

/// Phone leaderboard body (design `leaderboard_rankings`): scrolling header +
/// podium + rows, with the standing card pinned at the bottom.
class LeaderboardPhoneView extends StatelessWidget {
  const LeaderboardPhoneView({required this.state, this.onScope, super.key});

  final LeaderboardState state;
  final ValueChanged<LeaderboardScope>? onScope;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              KpSpacing.m,
              KpSpacing.m,
              KpSpacing.m,
              KpSpacing.l,
            ),
            children: [
              Text(
                context.l10n.leaderboardTitle,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap.xs(),
              Text(
                context.l10n.leaderboardSubtitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap.l(),
              LeaderboardScopeToggle(scope: state.scope, onScope: onScope),
              const Gap.xl(),
              LeaderboardPodium(podium: state.podium),
              const Gap.l(),
              for (final e in state.rows) ...[
                LeaderboardRankRow(entry: e),
                const Gap.s(),
              ],
            ],
          ),
        ),
        if (state.standing != null)
          LeaderboardStandingCard(standing: state.standing!),
      ],
    );
  }
}
