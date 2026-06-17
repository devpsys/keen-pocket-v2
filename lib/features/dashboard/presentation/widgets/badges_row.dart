import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

class BadgesRow extends StatelessWidget {
  const BadgesRow({required this.points, required this.badges, super.key});

  static const double _ringSize = 56;

  final int points;
  final List<String> badges;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          SizedBox(
            width: _ringSize,
            height: _ringSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: (points / 100).clamp(0, 1),
                    strokeWidth: KpSpacing.xs,
                    strokeCap: StrokeCap.round,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$points', style: context.textTheme.titleMedium),
                    Text(
                      context.l10n.dashboardPoints,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Wrap(
              spacing: KpSpacing.xs,
              runSpacing: KpSpacing.xs,
              children: [for (final badge in badges) BadgeChip(label: badge)],
            ),
          ),
        ],
      ),
    );
  }
}

class BadgeChip extends StatelessWidget {
  const BadgeChip({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.military_tech_rounded,
            size: KpSpacing.m,
            color: context.colors.warning,
          ),
          const Gap.xxs(horizontal: true),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
