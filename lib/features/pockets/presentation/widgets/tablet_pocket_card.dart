import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// A pocket card used in the tablet grid (my_pockets_tablet). Renders differently
/// for pockets the user [organiser]s versus ones they've merely joined.
class TabletPocketCard extends StatelessWidget {
  const TabletPocketCard({
    required this.pocket,
    required this.organiser,
    required this.onTap,
    super.key,
  });

  final Pocket pocket;
  final bool organiser;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final pct = (pocket.fillRate * 100).round();
    final boxColor = organiser
        ? context.colorScheme.secondaryContainer
        : context.colorScheme.surfaceContainerHighest;
    final iconColor = organiser
        ? context.colorScheme.onSecondaryContainer
        : context.colorScheme.primary;
    return KpCard.interactive(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: KpRadii.allM,
                ),
                child: Icon(KpIcons.savings, color: iconColor),
              ),
              PocketStatusPill(isFull: pocket.isFull),
            ],
          ),
          const Gap.s(),
          Text(
            pocket.name,
            style: context.textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap.xxs(),
          Row(
            children: [
              Flexible(
                child: Text(
                  organiser
                      ? context.l10n.pocketsMonthlyContribution
                      : context.l10n.pocketsYourShare,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Gap.xxs(horizontal: true),
              Text(
                pocket.handPrice.formatShort(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          Row(
            children: [
              Icon(
                KpIcons.group,
                size: KpSpacing.m,
                color: context.colorScheme.onSurfaceVariant,
              ),
              const Gap.xxs(horizontal: true),
              Text(
                organiser
                    ? context.l10n.pocketsHandsJoined(pocket.filledHands)
                    : context.l10n.pocketMembersCount(pocket.memberCount),
                style: context.textTheme.labelMedium?.copyWith(
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
                organiser
                    ? context.l10n.pocketsGoalProgress
                    : context.l10n.pocketsCycleProgress,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '$pct%',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap.xs(),
          KpProgressBar(value: pocket.fillRate),
        ],
      ),
    );
  }
}

/// Small pill showing whether a pocket is full or still active.
class PocketStatusPill extends StatelessWidget {
  const PocketStatusPill({required this.isFull, super.key});

  final bool isFull;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        isFull
            ? context.l10n.pocketStatusFull
            : context.l10n.pocketStatusActive,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
