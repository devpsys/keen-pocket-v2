import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/contributions.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_pill.dart';

/// Circular progress ring + contribute CTA for the current user's pocket goal.
class PocketProgressCard extends StatelessWidget {
  const PocketProgressCard({required this.pocket, super.key});

  static const double _ringSize = 140;

  final Pocket pocket;

  @override
  Widget build(BuildContext context) {
    final progress = pocket.fillRate == 0 ? 0.5 : pocket.fillRate;
    return KpCard(
      child: Column(
        children: [
          SizedBox(
            width: _ringSize,
            height: _ringSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: KpSpacing.s,
                    strokeCap: StrokeCap.round,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                  ),
                ),
                Text(
                  '${(progress * 100).round()}%',
                  style: context.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const Gap.m(),
          Text(
            context.l10n.pocketDetailMyProgress,
            style: context.textTheme.titleMedium,
          ),
          const Gap.xs(),
          Text(
            context.l10n.pocketDetailProgressDesc(
              const Money(1500000).format(),
              const Money(3000000).format(),
            ),
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap.s(),
          PocketPill(
            label: context.l10n.pocketDetailMonthsCompleted(3, 6),
            tone: PocketPillTone.info,
          ),
          const Gap.l(),
          ContributeButton(
            target: ContributionContext.pocket(pocket.id),
            variant: KpButtonVariant.secondary,
          ),
        ],
      ),
    );
  }
}
