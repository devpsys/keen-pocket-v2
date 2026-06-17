import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// A gradient-banner pocket card for the phone pockets list
/// (design `my_pockets_2`): an emoji + name banner with an OPEN/CLOSED status
/// pill, then per-hand price, hand count, schedule and a progress bar.
class PocketCard extends StatelessWidget {
  const PocketCard({required this.pocket, required this.onTap, super.key});

  static const double _bannerHeight = 112;
  static const List<String> _emojis = ['💰', '✈️', '🏠', '🎓', '🛒', '🎉'];
  static const List<int> _durations = [6, 12, 9, 18];

  final Pocket pocket;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final closed = pocket.isFull;
    final seed = pocket.id.hashCode.abs();
    final emoji = _emojis[seed % _emojis.length];
    final months = _durations[seed % _durations.length];
    final year = 2025 + (seed % 2);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerLowest,
          borderRadius: KpRadii.allXl,
          border: Border(
            bottom: BorderSide(
              color: context.colorScheme.surfaceContainerHighest,
              width: 7,
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: KpRadii.allXl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Banner(emoji: emoji, name: pocket.name, closed: closed),
              Padding(
                padding: const EdgeInsets.all(KpSpacing.m),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l10n.pocketsPerHand(
                            pocket.handPrice.format(),
                          ),
                          style: context.textTheme.labelLarge?.copyWith(
                            color: closed
                                ? context.colorScheme.outline
                                : context.colorScheme.primary,
                          ),
                        ),
                        Text(
                          context.l10n.pocketsHandsCount(pocket.totalHands),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const Gap.xs(),
                    Row(
                      children: [
                        Icon(
                          KpIcons.calendar,
                          size: KpSpacing.m,
                          color: context.colorScheme.outline,
                        ),
                        const Gap.xxs(horizontal: true),
                        Text(
                          context.l10n.pocketsScheduleLabel(months, year),
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                    if (!closed) ...[
                      const Gap.m(),
                      KpProgressBar(
                        value: pocket.fillRate,
                        color: context.colors.warning,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({
    required this.emoji,
    required this.name,
    required this.closed,
  });

  final String emoji;
  final String name;
  final bool closed;

  @override
  Widget build(BuildContext context) {
    final colors = closed
        ? [context.colorScheme.outline, context.colorScheme.onSurfaceVariant]
        : [KpColors.brand500, KpColors.brand800];
    return Container(
      height: PocketCard._bannerHeight,
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: _StatusPill(closed: closed),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(emoji, style: context.textTheme.headlineMedium),
                const Gap.xs(horizontal: true),
                Flexible(
                  child: Text(
                    name,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.colorScheme.onPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
  const _StatusPill({required this.closed});

  static const double _dotSize = 8;

  final bool closed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _dotSize,
            height: _dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: closed
                  ? context.colorScheme.error
                  : context.colors.success,
            ),
          ),
          const Gap.xxs(horizontal: true),
          Text(
            closed
                ? context.l10n.pocketStatusClosed
                : context.l10n.pocketStatusOpen,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
