import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// Wide progress card for the tablet hub: a circular goal ring on the left and
/// the user's contribution stats plus a "Contribute Now" CTA on the right.
class PocketProgressCardTablet extends StatelessWidget {
  const PocketProgressCardTablet({required this.pocket, super.key});

  static const double _ringSize = 80;

  final Pocket pocket;

  @override
  Widget build(BuildContext context) {
    final percent = (pocket.fillRate * 100).round();
    final target = Money(pocket.handPrice.kobo * pocket.totalHands);
    final contributed = Money((target.kobo * pocket.fillRate).round());
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _ringSize,
            height: _ringSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CircularProgressIndicator(
                    value: pocket.fillRate,
                    strokeWidth: KpSpacing.xs,
                    strokeCap: StrokeCap.round,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$percent%',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                    Text(
                      context.l10n.pocketDetailGoal.toUpperCase(),
                      style: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap.l(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  context.l10n.pocketDetailMyProgress,
                  style: context.textTheme.titleMedium,
                ),
                const Gap.m(),
                Row(
                  children: [
                    Expanded(
                      child: _StatTile(
                        label: context.l10n.pocketDetailContributed,
                        value: contributed.formatShort(),
                      ),
                    ),
                    const Gap.xxs(horizontal: true),
                    Expanded(
                      child: _StatTile(
                        label: context.l10n.pocketDetailFrequency,
                        value: context.l10n.pocketDetailFrequencyMonthly,
                      ),
                    ),
                  ],
                ),
                const Gap.m(),
                KpButton(
                  label: context.l10n.pocketDetailContributeNow,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Surface-tinted stat tile (uppercase label + value) for the progress card.
class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.xxs(),
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
