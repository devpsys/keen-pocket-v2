import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_fixtures.dart';

/// "Achievements" card with a View-All link and three coloured badges.
class ProfileAchievements extends StatelessWidget {
  const ProfileAchievements({this.onViewAll, super.key});

  static const double _badge = 64;

  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    // Per-badge colours, matching the design: gold, brand-blue, coral.
    final palette = <(Color, Color)>[
      (
        context.colorScheme.secondaryContainer,
        context.colorScheme.onSecondaryContainer,
      ),
      (context.colorScheme.primary, context.colorScheme.onPrimary),
      (
        context.colorScheme.errorContainer,
        context.colorScheme.onErrorContainer,
      ),
    ];
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.profileAchievements,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: onViewAll,
                child: Text(
                  context.l10n.profileViewAll,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const Gap.l(),
          Row(
            children: [
              for (var i = 0; i < kProfileAchievements.length; i++)
                Expanded(
                  child: _Badge(
                    achievement: kProfileAchievements[i],
                    bg: palette[i % palette.length].$1,
                    fg: palette[i % palette.length].$2,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.achievement, required this.bg, required this.fg});

  final ProfileAchievement achievement;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ProfileAchievements._badge,
          height: ProfileAchievements._badge,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Icon(achievement.icon, color: fg, size: KpSpacing.xl),
        ),
        const Gap.s(),
        Text(
          achievement.label,
          style: context.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
