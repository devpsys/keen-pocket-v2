import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/plans/presentation/view_models/plan_item_view.dart';

/// Column flexes shared by the checklist header and each [PlanChecklistRow] so
/// the table-like layout stays aligned (design `grocery_plan_detail_tablet`).
class PlanChecklistFlex {
  const PlanChecklistFlex._();

  static const int status = 2;
  static const int item = 6;
  static const int category = 3;
  static const int price = 3;
  static const int actions = 3;
}

/// One checklist row in the tablet plan-detail table: a status icon, the item
/// description (with optional priority star + qty/price line), a category chip,
/// the line total and an actions cell.
class PlanChecklistRow extends StatelessWidget {
  const PlanChecklistRow({required this.item, super.key});

  final PlanItemView item;

  static const double _statusBox = 24;

  @override
  Widget build(BuildContext context) {
    final purchased = item.status == PlanItemStatus.purchased;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: PlanChecklistFlex.status,
            child: _StatusIcon(status: item.status),
          ),
          Expanded(
            flex: PlanChecklistFlex.item,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium?.copyWith(
                          decoration: purchased
                              ? TextDecoration.lineThrough
                              : null,
                          color: purchased
                              ? context.colorScheme.onSurfaceVariant
                              : context.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    if (item.starred) ...[
                      const Gap.xxs(horizontal: true),
                      Icon(
                        Icons.star_rounded,
                        size: KpSpacing.m,
                        color: context.colors.warning,
                      ),
                    ],
                  ],
                ),
                Text(
                  context.l10n.planItemQtyPrice(
                    item.quantity,
                    item.unitPrice.format(),
                  ),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: PlanChecklistFlex.category,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _CategoryChip(label: item.category),
            ),
          ),
          Expanded(
            flex: PlanChecklistFlex.price,
            child: Text(
              item.total.format(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Expanded(
            flex: PlanChecklistFlex.actions,
            child: Row(
              children: [
                _ActionIcon(
                  icon: Icons.edit_rounded,
                  color: context.colorScheme.outline,
                ),
                const Gap.xs(horizontal: true),
                _ActionIcon(
                  icon: purchased
                      ? Icons.delete_outline_rounded
                      : Icons.history_rounded,
                  color: context.colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  const _StatusIcon({required this.status});

  final PlanItemStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case PlanItemStatus.purchased:
        return Icon(Icons.check_circle_rounded, color: context.colors.success);
      case PlanItemStatus.deferred:
        return Icon(Icons.history_rounded, color: context.colorScheme.outline);
      case PlanItemStatus.pending:
        return Container(
          width: PlanChecklistRow._statusBox,
          height: PlanChecklistRow._statusBox,
          decoration: BoxDecoration(
            borderRadius: KpRadii.allS,
            border: Border.all(color: context.colorScheme.outline, width: 2),
          ),
        );
    }
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label});

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
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Icon(icon, size: KpSpacing.l, color: color),
    );
  }
}
