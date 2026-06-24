import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/gamification/presentation/achievements_fixtures.dart';
import 'package:keenpockets/features/gamification/presentation/view_models/achievements_view.dart';

/// Icon + circle-tint + icon-color for a badge (shared phone + tablet).
({IconData icon, Color bg, Color fg}) badgeStyle(
  BuildContext context,
  AchievementBadge kind, {
  required bool earned,
}) {
  if (!earned) {
    return (
      icon: Icons.savings_rounded,
      bg: context.colorScheme.surfaceContainerHighest,
      fg: context.colorScheme.outline,
    );
  }
  return switch (kind) {
    AchievementBadge.reliablePayer => (
      icon: Icons.verified_user_rounded,
      bg: KpColors.tertiary100,
      fg: context.colorScheme.tertiary,
    ),
    AchievementBadge.topOrganizer => (
      icon: Icons.star_rounded,
      bg: KpColors.gold100,
      fg: KpColors.gold600,
    ),
    AchievementBadge.recruiter => (
      icon: Icons.group_add_rounded,
      bg: KpColors.brand100,
      fg: context.colorScheme.primary,
    ),
    AchievementBadge.bigSaver => (
      icon: Icons.savings_rounded,
      bg: KpColors.brand100,
      fg: context.colorScheme.primary,
    ),
  };
}

/// Icon + tint for an upcoming-milestone row (tablet).
({IconData icon, Color bg, Color fg}) milestoneStyle(
  BuildContext context,
  MilestoneKind kind,
) {
  return switch (kind) {
    MilestoneKind.consistentContributor => (
      icon: Icons.rocket_launch_rounded,
      bg: context.colorScheme.secondaryContainer,
      fg: context.colorScheme.onSecondaryContainer,
    ),
    MilestoneKind.groupGuardian => (
      icon: Icons.shield_rounded,
      bg: context.colorScheme.primaryContainer,
      fg: context.colorScheme.onPrimaryContainer,
    ),
  };
}

/// Candy card with a coloured 7px bottom border (design `chunky-card`).
BoxDecoration achievementCard(BuildContext context, {Color? accent}) {
  return BoxDecoration(
    color: context.colorScheme.surface,
    borderRadius: KpRadii.allXl,
    border: Border(
      bottom: BorderSide(
        color: accent ?? context.colorScheme.surfaceContainerHighest,
        width: 7,
      ),
    ),
  );
}

/// A candy card with a faint, rotated icon watermark in the top-right corner
/// (design `my_achievements_badges`).
class WatermarkCard extends StatelessWidget {
  const WatermarkCard({
    required this.accent,
    required this.watermark,
    required this.child,
    super.key,
  });

  final Color accent;
  final IconData watermark;
  final Widget child;

  static const double _size = 120;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: achievementCard(context, accent: accent),
      child: ClipRRect(
        borderRadius: KpRadii.allXl,
        child: Stack(
          children: [
            Positioned(
              top: -KpSpacing.m,
              right: -KpSpacing.m,
              child: Transform.rotate(
                angle: 0.2,
                child: Icon(
                  watermark,
                  size: _size,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.06),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(KpSpacing.l), child: child),
          ],
        ),
      ),
    );
  }
}

/// Phone achievements screen (design `my_achievements_badges`).
class AchievementsPhoneView extends StatelessWidget {
  const AchievementsPhoneView({
    required this.data,
    this.onBuyFreezes,
    this.onViewPockets,
    super.key,
  });

  final AchievementsView data;
  final VoidCallback? onBuyFreezes;
  final VoidCallback? onViewPockets;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxl,
      ),
      children: [
        MomentumCard(data: data),
        const Gap.l(),
        SafetyNetCard(freezes: data.freezes, onBuy: onBuyFreezes),
        const Gap.xl(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                context.l10n.achievementsYourBadges,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Gap.s(horizontal: true),
            Text(
              context.l10n.achievementsEarnedCount(
                data.earnedCount,
                data.totalBadges,
              ),
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Gap.m(),
        LayoutBuilder(
          builder: (context, c) {
            final w = (c.maxWidth - KpSpacing.m) / 2;
            return Wrap(
              spacing: KpSpacing.m,
              runSpacing: KpSpacing.m,
              children: [
                for (final b in data.badges)
                  SizedBox(
                    width: w,
                    child: BadgeCard(badge: b),
                  ),
              ],
            );
          },
        ),
        const Gap.xl(),
        MotivationCard(onViewPockets: onViewPockets),
        const Gap.l(),
        const ProTipCard(),
      ],
    );
  }
}

class MomentumCard extends StatelessWidget {
  const MomentumCard({required this.data, super.key});

  final AchievementsView data;

  @override
  Widget build(BuildContext context) {
    return WatermarkCard(
      accent: context.colorScheme.secondaryContainer,
      watermark: Icons.local_fire_department_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.achievementsCurrentMomentum.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.outline,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          const Gap.s(),
          Text(
            context.l10n.achievementsStreakHeading(data.streakWeeks),
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap.l(),
          Row(
            children: [
              Expanded(
                child: KpProgressBar(
                  value: data.streakProgress,
                  color: context.colorScheme.secondary,
                ),
              ),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.achievementsDaysShort(
                  data.streakDaysDone,
                  data.streakDaysTotal,
                ),
                style: context.textTheme.labelLarge?.copyWith(
                  color: KpColors.gold600,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SafetyNetCard extends StatelessWidget {
  const SafetyNetCard({required this.freezes, this.onBuy, super.key});

  final int freezes;
  final VoidCallback? onBuy;

  // KpButton stretches to its constraints, so give the design's auto-width CTA
  // a bounded box rather than letting it fill the card.
  static const double _buyButtonWidth = 200;

  @override
  Widget build(BuildContext context) {
    return WatermarkCard(
      accent: context.colorScheme.primary,
      watermark: Icons.ac_unit_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.achievementsSafetyNet.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.outline,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          const Gap.s(),
          Text(
            context.l10n.achievementsFreezesHeading(freezes),
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const Gap.s(),
          Text(
            context.l10n.achievementsFreezesHint,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.m(),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: _buyButtonWidth,
              child: KpButton(
                label: context.l10n.achievementsBuyMoreFreezes,
                onPressed: onBuy ?? () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BadgeCard extends StatelessWidget {
  const BadgeCard({required this.badge, this.showCaption = true, super.key});

  final BadgeView badge;
  final bool showCaption;

  @override
  Widget build(BuildContext context) {
    final style = badgeStyle(context, badge.kind, earned: badge.earned);
    return Opacity(
      opacity: badge.earned ? 1 : 0.6,
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.l),
        decoration: achievementCard(context),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: KpSpacing.xxl,
                  height: KpSpacing.xxl,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: style.bg,
                    shape: BoxShape.circle,
                    border: Border.all(color: style.fg, width: 3),
                  ),
                  child: Icon(style.icon, color: style.fg, size: KpSpacing.xl),
                ),
                if (!badge.earned)
                  Positioned(
                    top: -KpSpacing.xxs,
                    right: -KpSpacing.xxs,
                    child: Container(
                      padding: const EdgeInsets.all(KpSpacing.xxs),
                      decoration: BoxDecoration(
                        color: context.colorScheme.onSurface,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.lock_rounded,
                        size: KpSpacing.s,
                        color: context.colorScheme.surface,
                      ),
                    ),
                  ),
              ],
            ),
            const Gap.m(),
            Text(
              badge.earned ? '🏅 ${badge.label}' : badge.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            if (showCaption) ...[
              const Gap.xxs(),
              Text(
                badge.caption,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.outline,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class MotivationCard extends StatelessWidget {
  const MotivationCard({this.onViewPockets, super.key});

  final VoidCallback? onViewPockets;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [context.colorScheme.primary, KpColors.brand700],
        ),
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onPrimaryContainer,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: KpNetworkImage(
              url: kAchievementsMascotUrl,
              width: KpSpacing.xxxl + KpSpacing.xxl,
              height: KpSpacing.xxxl + KpSpacing.xxl,
              fit: BoxFit.contain,
            ),
          ),
          const Gap.m(),
          Text(
            context.l10n.achievementsOnARoll,
            style: context.textTheme.headlineSmall?.copyWith(
              color: onPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.achievementsMotivationBody,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: onPrimary.withValues(alpha: 0.9),
            ),
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.achievementsViewPockets,
            variant: KpButtonVariant.secondary,
            onPressed: onViewPockets ?? () {},
          ),
        ],
      ),
    );
  }
}

class ProTipCard extends StatelessWidget {
  const ProTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    final onGold = context.colorScheme.onSecondaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allXl,
        border: const Border(
          bottom: BorderSide(color: KpColors.gold600, width: 7),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.workspace_premium_rounded,
            color: onGold,
            size: KpSpacing.xl,
          ),
          const Gap.s(),
          Text(
            context.l10n.achievementsProTip.toUpperCase(),
            style: context.textTheme.labelMedium?.copyWith(
              color: onGold,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.achievementsProTipBody,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: onGold,
            ),
          ),
        ],
      ),
    );
  }
}
