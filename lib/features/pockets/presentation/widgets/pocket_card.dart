import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// Chunky card for a pocket: name + status pill, fill progress and the user's
/// next hand (design phase D — `my_pockets`).
class PocketCard extends StatelessWidget {
  const PocketCard({required this.pocket, required this.onTap, super.key});

  final Pocket pocket;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return KpCard.interactive(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pocket.name,
                  style: context.textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _StatusPill(isFull: pocket.isFull),
            ],
          ),
          const Gap.xs(),
          Text(
            context.l10n.pocketMembersCount(pocket.memberCount),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.s(),
          KpProgressBar(value: pocket.fillRate),
          const Gap.xs(),
          Text(
            context.l10n.pocketHandsFilled(
              pocket.filledHands,
              pocket.totalHands,
            ),
            style: context.textTheme.bodySmall,
          ),
          const Gap.s(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: KpRadii.allM,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.pocketNextHand,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  pocket.handPrice.format(),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
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

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.isFull});

  final bool isFull;

  @override
  Widget build(BuildContext context) {
    final color = isFull
        ? context.colorScheme.onSurfaceVariant
        : context.colors.success;
    final bg = isFull
        ? context.colorScheme.surfaceContainerHighest
        : context.colors.successContainer;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        isFull
            ? context.l10n.pocketStatusFull
            : context.l10n.pocketStatusActive,
        style: context.textTheme.labelSmall?.copyWith(color: color),
      ),
    );
  }
}
