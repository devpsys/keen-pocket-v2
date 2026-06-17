import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({required this.data, super.key});

  static const double _emojiCircle = 56;
  static const double _progressWidth = 160;
  static const double _claimWidth = 170;

  final DashboardView data;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: _emojiCircle,
                  height: _emojiCircle,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorScheme.errorContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Text('🔥', style: context.textTheme.headlineMedium),
                ),
                const Gap.m(horizontal: true),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.dashboardStreakTitle(data.streakDays),
                        style: context.textTheme.titleLarge,
                      ),
                      Text(
                        context.l10n.dashboardStreakSubtitle(data.freezesLeft),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          SizedBox(
            width: _progressWidth,
            child: KpProgressBar(
              value: data.weeklyGoalProgress,
              color: context.colorScheme.secondary,
            ),
          ),
          const Gap.m(horizontal: true),
          SizedBox(
            width: _claimWidth,
            child: KpButton(
              label: context.l10n.dashboardClaimReward,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
