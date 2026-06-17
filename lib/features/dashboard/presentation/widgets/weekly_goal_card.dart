import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_common.dart';

class WeeklyGoalCard extends StatelessWidget {
  const WeeklyGoalCard({required this.data, super.key});

  static const double _claimWidth = 180;

  final DashboardView data;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.track_changes_rounded,
                color: context.colorScheme.error,
              ),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(
                  context.l10n.dashboardWeeklyGoal,
                  style: context.textTheme.titleMedium,
                ),
              ),
              if (data.weeklyGoalComplete)
                DashboardPill(
                  label: context.l10n.dashboardComplete,
                  icon: Icons.check_circle_rounded,
                ),
            ],
          ),
          const Gap.m(),
          Row(
            children: [
              Expanded(
                child: MiniBadge(
                  icon: Icons.local_fire_department_rounded,
                  tint: context.colors.warning,
                  value: '${data.streakDays}',
                  label: context.l10n.dashboardWeekStreak,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: MiniBadge(
                  icon: Icons.ac_unit_rounded,
                  tint: context.colorScheme.primary,
                  value: '${data.freezesLeft}',
                  label: context.l10n.dashboardFreezesLeft,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.dashboardResetsMonday.toUpperCase(),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              if (data.weeklyGoalComplete)
                SizedBox(
                  width: _claimWidth,
                  child: KpButton(
                    label: context.l10n.dashboardClaimReward,
                    onPressed: () {},
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniBadge extends StatelessWidget {
  const MiniBadge({
    required this.icon,
    required this.tint,
    required this.value,
    required this.label,
    super.key,
  });

  final IconData icon;
  final Color tint;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        children: [
          Icon(icon, color: tint, size: KpSpacing.l),
          const Gap.xs(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: context.textTheme.titleMedium),
                Text(
                  label.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
