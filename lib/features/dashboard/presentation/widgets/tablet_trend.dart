import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

class TabletTrend extends StatelessWidget {
  const TabletTrend({super.key});

  static const double _plotHeight = 220;
  static const _bars = <(double, double)>[
    (0.40, 0.2),
    (0.60, 0.4),
    (0.80, 0.6),
    (0.50, 1.0),
    (0.30, 0.3),
    (0.70, 0.5),
  ];

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.dashboardContributionTrend,
                style: context.textTheme.titleLarge,
              ),
              RangeChip(label: context.l10n.dashboardLast7Days),
            ],
          ),
          const Gap.m(),
          Container(
            height: _plotHeight,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: KpRadii.allL,
              border: Border.all(color: context.colorScheme.outlineVariant),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final b in _bars) ...[
                      Container(
                        width: KpSpacing.xl,
                        height: 120 * b.$1,
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withValues(
                            alpha: b.$2,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            top: KpRadii.radiusS,
                          ),
                        ),
                      ),
                      const Gap.s(horizontal: true),
                    ],
                  ],
                ),
                const Gap.m(),
                Text(
                  context.l10n.dashboardTrendCaption,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
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

class RangeChip extends StatelessWidget {
  const RangeChip({required this.label, super.key});

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
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: context.textTheme.labelLarge),
          const Gap.xxs(horizontal: true),
          Icon(
            Icons.expand_more_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
