import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/view_models/plan_item_view.dart';

/// A single row in the grocery plan item checklist (design
/// `grocery_plan_detail`): a status box on the left, the item name + qty/price
/// in the middle, and the total + status pill + a status-dependent action on the
/// right.
class PlanDetailItemRow extends StatelessWidget {
  const PlanDetailItemRow({required this.item, super.key});

  final PlanItemView item;

  /// Fixed width for the pending "I'll buy it" candy button so it cannot grow
  /// to unbounded width inside the trailing [Row].
  static const double _buyButtonWidth = 132;

  /// Side of the square status box on the left.
  static const double _statusBoxSize = 24;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final pending = item.status == PlanItemStatus.pending;
    final purchased = item.status == PlanItemStatus.purchased;

    // The pending card gets a gold chunky bottom border to draw the eye; the
    // others use the neutral chunky border like every KpCard.
    final borderTint = pending
        ? scheme.secondaryContainer
        : scheme.surfaceContainerHighest;

    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: KpRadii.allXl,
        border: Border(
          top: BorderSide(color: borderTint, width: 2),
          left: BorderSide(color: borderTint, width: 2),
          right: BorderSide(color: borderTint, width: 2),
          bottom: BorderSide(color: borderTint, width: 7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _StatusBox(status: item.status),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        item.name,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: purchased
                              ? scheme.onSurface.withValues(alpha: 0.5)
                              : scheme.onSurface,
                          decoration: purchased
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    if (item.starred) ...[
                      const Gap.xs(horizontal: true),
                      Icon(
                        Icons.star_rounded,
                        size: KpSpacing.m,
                        color: context.colors.warning,
                      ),
                    ],
                  ],
                ),
                const Gap.xxs(),
                Text(
                  context.l10n.planItemQtyPrice(
                    item.quantity,
                    item.unitPrice.format(),
                  ),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item.total.format(), style: context.textTheme.titleMedium),
              const Gap.xxs(),
              _StatusPill(status: item.status),
              const Gap.xs(),
              _TrailingAction(item: item, buyButtonWidth: _buyButtonWidth),
            ],
          ),
        ],
      ),
    );
  }
}

/// The left-hand square that visually encodes the item's lifecycle state.
class _StatusBox extends StatelessWidget {
  const _StatusBox({required this.status});

  final PlanItemStatus status;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    switch (status) {
      case PlanItemStatus.purchased:
        return Container(
          height: PlanDetailItemRow._statusBoxSize,
          width: PlanDetailItemRow._statusBoxSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: scheme.primary,
            borderRadius: KpRadii.allS,
          ),
          child: Icon(
            Icons.check_rounded,
            size: KpSpacing.m,
            color: scheme.onPrimary,
          ),
        );
      case PlanItemStatus.pending:
        return Container(
          height: PlanDetailItemRow._statusBoxSize,
          width: PlanDetailItemRow._statusBoxSize,
          decoration: BoxDecoration(
            borderRadius: KpRadii.allS,
            border: Border.all(color: scheme.outline, width: 2),
          ),
        );
      case PlanItemStatus.deferred:
        return SizedBox(
          height: PlanDetailItemRow._statusBoxSize,
          width: PlanDetailItemRow._statusBoxSize,
          child: Icon(
            Icons.history_rounded,
            size: PlanDetailItemRow._statusBoxSize,
            color: scheme.outline,
          ),
        );
    }
  }
}

/// The small uppercase status chip under the item total.
class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final PlanItemStatus status;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final (Color bg, Color fg, String label) = switch (status) {
      PlanItemStatus.purchased => (
        scheme.primaryContainer,
        scheme.onPrimaryContainer,
        context.l10n.planItemPurchased,
      ),
      PlanItemStatus.pending => (
        scheme.surfaceContainerHighest,
        scheme.onSurfaceVariant,
        context.l10n.planItemPending,
      ),
      PlanItemStatus.deferred => (
        scheme.errorContainer,
        scheme.onErrorContainer,
        context.l10n.planItemDeferred,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(color: bg, borderRadius: KpRadii.allS),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}

/// Status-dependent trailing control: a claimed-by avatar, a buy button or a
/// re-activate text button.
class _TrailingAction extends StatelessWidget {
  const _TrailingAction({required this.item, required this.buyButtonWidth});

  final PlanItemView item;
  final double buyButtonWidth;

  @override
  Widget build(BuildContext context) {
    switch (item.status) {
      case PlanItemStatus.purchased:
        final initial = (item.claimedBy ?? '').isNotEmpty
            ? item.claimedBy![0].toUpperCase()
            : '?';
        return CircleAvatar(
          radius: KpSpacing.m,
          backgroundColor: context.colorScheme.surfaceContainerHighest,
          child: Text(
            initial,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        );
      case PlanItemStatus.pending:
        return SizedBox(
          width: buyButtonWidth,
          child: KpButton(
            label: context.l10n.planItemBuyIt,
            caps: true,
            onPressed: () {},
          ),
        );
      case PlanItemStatus.deferred:
        return TextButton(
          onPressed: () {},
          child: Text(
            context.l10n.planItemReactivate,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        );
    }
  }
}
