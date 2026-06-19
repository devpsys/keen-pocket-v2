import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/dashed_rrect_painter.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_tablet_card.dart';

/// Tablet layout for the Adashi tab (design `adashi_circles_tablet`): a title +
/// "New Group" header, a search/filter row, a 3-column card grid ending in a
/// "Join a Circle" tile, and a Mr K "Did you know?" banner.
class AdashiTabletView extends StatelessWidget {
  const AdashiTabletView({
    required this.circles,
    required this.onCreate,
    this.onOpenAdashi,
    this.onBrowseExplore,
    super.key,
  });

  static const int _columns = 3;

  final List<AdashiSummaryView> circles;
  final VoidCallback onCreate;
  final ValueChanged<String>? onOpenAdashi;
  final VoidCallback? onBrowseExplore;

  @override
  Widget build(BuildContext context) {
    final activeCount = circles.where((c) => c.isActive).length;

    final cells = <Widget>[
      for (final circle in circles)
        AdashiTabletCard(
          adashi: circle,
          onTap: () => onOpenAdashi?.call(circle.id),
        ),
      _JoinCircleCard(onTap: onBrowseExplore),
    ];
    final rows = <List<Widget>>[
      for (var i = 0; i < cells.length; i += _columns)
        cells.sublist(i, (i + _columns).clamp(0, cells.length)),
    ];

    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.adashiMyGroupsTitle,
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.adashiActiveInCircles(activeCount),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap.m(horizontal: true),
            _NewGroupButton(onTap: onCreate),
          ],
        ),
        const Gap.xl(),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: context.l10n.adashiSearchHint,
                  prefixIcon: const Icon(KpIcons.search, size: KpSpacing.l),
                  border: OutlineInputBorder(
                    borderRadius: KpRadii.allL,
                    borderSide: BorderSide(
                      color: context.colorScheme.surfaceContainerHighest,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const Gap.m(horizontal: true),
            _FilterChip(
              icon: Icons.filter_list_rounded,
              label: context.l10n.adashiStatusActive,
            ),
            const Gap.s(horizontal: true),
            _FilterChip(
              icon: Icons.history_rounded,
              label: context.l10n.adashiStatusCompleted,
            ),
          ],
        ),
        const Gap.xl(),
        for (var r = 0; r < rows.length; r++) ...[
          if (r > 0) const Gap.l(),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var c = 0; c < _columns; c++) ...[
                  if (c > 0) const Gap.l(horizontal: true),
                  Expanded(
                    child: c < rows[r].length
                        ? rows[r][c]
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ),
        ],
        const Gap.xl(),
        const _DidYouKnowBanner(),
      ],
    );
  }
}

/// Outlined search filter chip ("Active" / "Completed").
class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final fg = context.colorScheme.onSurfaceVariant;
    // Design: white pill with a 2px surface-variant border and `rounded-2xl`
    // (16px) corners — not a full pill.
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.s,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allL,
        border: Border.all(
          color: context.colorScheme.surfaceContainerHighest,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: KpSpacing.m, color: fg),
          const Gap.xs(horizontal: true),
          Text(label, style: context.textTheme.labelLarge?.copyWith(color: fg)),
        ],
      ),
    );
  }
}

/// Compact candy "New Group" button (design header): brand face, dark
/// on-container text + filled `add_circle`, 12px radius, 4px candy base.
class _NewGroupButton extends StatelessWidget {
  const _NewGroupButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = context.colorScheme.onPrimaryContainer;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.l,
          vertical: KpSpacing.m,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: KpRadii.allM,
          border: const Border(
            bottom: BorderSide(color: KpColors.brand600, width: 4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add_circle_rounded, size: KpSpacing.l, color: fg),
            const Gap.s(horizontal: true),
            Text(
              context.l10n.adashiNewGroup,
              style: context.textTheme.labelLarge?.copyWith(
                color: fg,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Dashed-style "Join a Circle" prompt that closes the grid.
class _JoinCircleCard extends StatelessWidget {
  const _JoinCircleCard({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Design: surface-container fill behind a 2px *dashed* outline-variant
    // border, rounded 24px.
    return InkWell(
      onTap: onTap,
      borderRadius: KpRadii.allXl,
      child: CustomPaint(
        foregroundPainter: DashedRRectPainter(
          color: context.colorScheme.outlineVariant,
          radius: KpRadii.xl,
        ),
        child: Container(
          padding: const EdgeInsets.all(KpSpacing.l),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer.withValues(alpha: 0.4),
            borderRadius: KpRadii.allXl,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.m),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.surfaceContainerLowest,
                ),
                child: Icon(
                  Icons.group_add_rounded,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap.m(),
              Text(
                context.l10n.adashiJoinTitle,
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const Gap.xs(),
              Text(
                context.l10n.adashiJoinBody,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap.m(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.adashiBrowseExplore,
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Gap.xs(horizontal: true),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: KpSpacing.m,
                    color: context.colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// "Did you know?" banner with the Mr K mascot (design footer card).
class _DidYouKnowBanner extends StatelessWidget {
  const _DidYouKnowBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(KpSpacing.m),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: KpRadii.allXl,
              // Chunky candy depth (design `shadow-[0_8px_0_0_#004c6e]`).
              border: const Border(
                bottom: BorderSide(color: KpColors.brand600, width: 6),
              ),
            ),
            child: Icon(
              Icons.savings_rounded,
              size: KpSpacing.xl,
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap.l(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.adashiDidYouKnowTitle,
                  style: context.textTheme.titleLarge,
                ),
                const Gap.xs(),
                Text(
                  context.l10n.adashiDidYouKnowBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
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
