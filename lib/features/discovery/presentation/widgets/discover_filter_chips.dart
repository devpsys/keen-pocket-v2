import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Horizontally-scrolling category chips for the Discover tab. Presentation-only:
/// the selected chip is tracked locally; it does not filter the list yet.
class DiscoverFilterChips extends StatefulWidget {
  const DiscoverFilterChips({super.key});

  @override
  State<DiscoverFilterChips> createState() => _DiscoverFilterChipsState();
}

class _DiscoverFilterChipsState extends State<DiscoverFilterChips> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final chips = <({String emoji, String label})>[
      (emoji: '🔥', label: context.l10n.discoverFilterTrending),
      (emoji: '🏫', label: context.l10n.discoverFilterSchoolFees),
      (emoji: '🛒', label: context.l10n.discoverFilterGroceries),
      (emoji: '✈️', label: context.l10n.discoverFilterTravel),
    ];
    return SizedBox(
      height: _chipRowHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (_, _) => const Gap.s(horizontal: true),
        itemBuilder: (context, i) => _Chip(
          emoji: chips[i].emoji,
          label: chips[i].label,
          selected: i == _selected,
          onTap: () => setState(() => _selected = i),
        ),
      ),
    );
  }

  static const double _chipRowHeight = 40;
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.emoji,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String emoji;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected
        ? context.colorScheme.primaryContainer
        : context.colorScheme.surfaceContainer;
    final fg = selected
        ? context.colorScheme.onPrimaryContainer
        : context.colorScheme.onSurfaceVariant;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(KpRadii.pill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: context.textTheme.labelLarge),
            const Gap.xs(horizontal: true),
            Text(
              label.toUpperCase(),
              style: context.textTheme.labelLarge?.copyWith(color: fg),
            ),
          ],
        ),
      ),
    );
  }
}
