import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/gamification/presentation/achievements_fixtures.dart';
import 'package:keenpockets/features/gamification/presentation/view_models/achievements_view.dart';
import 'package:keenpockets/features/gamification/presentation/widgets/achievements_widgets.dart';

/// White chunky card (border + flat 7px bottom shadow) used across the tablet.
BoxDecoration _tabletCard(BuildContext context) => BoxDecoration(
  color: context.colorScheme.surface,
  borderRadius: KpRadii.allXl,
  border: Border.all(color: context.colorScheme.surfaceContainerHighest),
  boxShadow: [
    BoxShadow(
      color: context.colorScheme.surfaceContainerHighest,
      offset: const Offset(0, 7),
    ),
  ],
);

/// Tablet achievements dashboard (design `my_achievements_badges_tablet`): a
/// momentum/freezes/badges column on the left and a motivation/milestones/tip
/// column on the right. The nav rail is provided by `AppTabletShell`.
class AchievementsTabletView extends StatelessWidget {
  const AchievementsTabletView({
    required this.data,
    this.onBuyFreezes,
    super.key,
  });

  final AchievementsView data;
  final VoidCallback? onBuyFreezes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  _MomentumCard(data: data),
                  const Gap.l(),
                  _SafetyNetCard(freezes: data.freezes, onBuy: onBuyFreezes),
                  const Gap.l(),
                  _BadgesGrid(badges: data.badges),
                ],
              ),
            ),
            const Gap.l(horizontal: true),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  _HeroCard(data: data),
                  const Gap.l(),
                  _MilestonesCard(milestones: data.milestones),
                  const Gap.l(),
                  const _ProTipCard(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MomentumCard extends StatelessWidget {
  const _MomentumCard({required this.data});

  final AchievementsView data;

  @override
  Widget build(BuildContext context) {
    final pct = (data.streakProgress * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _tabletCard(context),
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
                    Text(
                      context.l10n.achievementsCurrentMomentum,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      context.l10n.achievementsMomentumSubtitle,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: KpSpacing.xxl,
                height: KpSpacing.xxl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.tertiaryContainer,
                  borderRadius: KpRadii.allL,
                ),
                child: Icon(
                  Icons.local_fire_department_rounded,
                  color: context.colorScheme.onTertiaryContainer,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                context.l10n.achievementsStreakValue(data.streakWeeks),
                style: context.textTheme.displaySmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.achievementsStreakWord,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.achievementsDaysProgress(
                  data.streakDaysDone,
                  data.streakDaysTotal,
                ),
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                '$pct%',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(
            value: data.streakProgress,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _SafetyNetCard extends StatelessWidget {
  const _SafetyNetCard({required this.freezes, this.onBuy});

  final int freezes;
  final VoidCallback? onBuy;

  // KpButton stretches to its constraints, so give the design's auto-width CTA
  // a bounded box rather than letting it fill the row.
  static const double _buyButtonWidth = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _tabletCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: KpSpacing.xl,
                height: KpSpacing.xl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.ac_unit_rounded,
                  color: context.colorScheme.primary,
                  size: KpSpacing.l,
                ),
              ),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.achievementsSafetyNet,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$freezes',
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      context.l10n.achievementsFreezesAvailable.toUpperCase(),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: _buyButtonWidth,
                child: KpButton(
                  label: context.l10n.achievementsBuyMore,
                  onPressed: onBuy ?? () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BadgesGrid extends StatelessWidget {
  const _BadgesGrid({required this.badges});

  final List<BadgeView> badges;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.achievementsYourBadges,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const Gap.m(),
        LayoutBuilder(
          builder: (context, c) {
            final w = (c.maxWidth - KpSpacing.m) / 2;
            return Wrap(
              spacing: KpSpacing.m,
              runSpacing: KpSpacing.m,
              children: [
                for (final b in badges)
                  SizedBox(
                    width: w,
                    child: BadgeCard(badge: b, showCaption: false),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.data});

  final AchievementsView data;

  @override
  Widget build(BuildContext context) {
    final onPrimary = context.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xl),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onPrimaryContainer,
            width: 7,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const KpNetworkImage(
            url: kAchievementsMascotUrl,
            width: KpSpacing.xxxl + KpSpacing.xxl,
            height: KpSpacing.xxxl + KpSpacing.xxl,
            fit: BoxFit.contain,
          ),
          const Gap.l(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.achievementsOnARoll,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: onPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Gap.s(),
                Text(
                  context.l10n.achievementsMotivationBody,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: onPrimary.withValues(alpha: 0.9),
                  ),
                ),
                const Gap.l(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KpSpacing.m,
                    vertical: KpSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: onPrimary.withValues(alpha: 0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(KpRadii.pill),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.workspace_premium_rounded,
                        color: context.colorScheme.secondaryContainer,
                        size: KpSpacing.l,
                      ),
                      const Gap.xs(horizontal: true),
                      Text(
                        context.l10n.achievementsEliteGoal(
                          data.eliteGoalDone,
                          data.eliteGoalTotal,
                        ),
                        style: context.textTheme.labelLarge?.copyWith(
                          color: onPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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

class _MilestonesCard extends StatelessWidget {
  const _MilestonesCard({required this.milestones});

  final List<MilestoneView> milestones;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _tabletCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.achievementsUpcomingMilestones,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.l(),
          for (var i = 0; i < milestones.length; i++) ...[
            if (i != 0) const Gap.l(),
            _MilestoneRow(milestone: milestones[i]),
          ],
        ],
      ),
    );
  }
}

class _MilestoneRow extends StatelessWidget {
  const _MilestoneRow({required this.milestone});

  final MilestoneView milestone;

  @override
  Widget build(BuildContext context) {
    final style = milestoneStyle(context, milestone.kind);
    final pct = (milestone.percent * 100).round();
    return Row(
      children: [
        Container(
          width: KpSpacing.xxl,
          height: KpSpacing.xxl,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: style.bg,
            borderRadius: KpRadii.allL,
          ),
          child: Icon(style.icon, color: style.fg),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    milestone.label,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '$pct%',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Gap.xs(),
              KpProgressBar(
                value: milestone.percent,
                color: context.colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProTipCard extends StatelessWidget {
  const _ProTipCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.primary),
      ),
      child: ClipRRect(
        borderRadius: KpRadii.allXl,
        child: Stack(
          children: [
            Positioned(
              right: -KpSpacing.m,
              bottom: -KpSpacing.m,
              child: Icon(
                Icons.lightbulb_rounded,
                size: 120,
                color: context.colorScheme.onPrimaryContainer.withValues(
                  alpha: 0.1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(KpSpacing.l),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: KpSpacing.xl,
                    height: KpSpacing.xl,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.psychology_rounded,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Gap.m(horizontal: true),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: KpSpacing.s,
                            vertical: KpSpacing.xxs,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(KpRadii.pill),
                            ),
                          ),
                          child: Text(
                            context.l10n.achievementsProTip.toUpperCase(),
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onPrimary,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const Gap.s(),
                        Text(
                          context.l10n.achievementsProTipBody,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
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
