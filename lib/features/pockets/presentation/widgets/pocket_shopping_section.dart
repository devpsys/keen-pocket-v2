import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/view_models/shopping_item_view.dart';

/// Group-shopping suggestions section embedded in `PocketDetailPage` (map §3).
/// Lists shared items with split costs and an estimated group total.
/// Presentation-only: [onSuggest] opens the suggest-item flow.
class PocketShoppingSection extends StatelessWidget {
  const PocketShoppingSection({
    required this.items,
    required this.estimatedTotal,
    this.onSuggest,
    super.key,
  });

  final List<ShoppingItemView> items;
  final Money estimatedTotal;
  final VoidCallback? onSuggest;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.shoppingListTitle,
              style: context.textTheme.titleLarge,
            ),
            Text(
              context.l10n.plansItemsCount(items.length),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const Gap.s(),
        if (items.isEmpty)
          Text(context.l10n.shoppingEmpty)
        else
          for (final item in items) ...[
            _ShoppingItemCard(item: item),
            const Gap.s(),
          ],
        const Gap.xs(),
        _TotalCard(total: estimatedTotal),
        const Gap.m(),
        KpButton(
          label: context.l10n.shoppingSuggestItem,
          icon: Icons.add_rounded,
          onPressed: onSuggest ?? () {},
        ),
      ],
    );
  }
}

class _ShoppingItemCard extends StatelessWidget {
  const _ShoppingItemCard({required this.item});

  final ShoppingItemView item;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(item.emoji, style: context.textTheme.titleLarge),
              const Gap.xs(horizontal: true),
              Expanded(
                child: Text(item.name, style: context.textTheme.titleMedium),
              ),
              _CategoryPill(label: item.category),
            ],
          ),
          const Gap.xs(),
          Row(
            children: [
              Text(
                context.l10n.shoppingUnitPrice(item.unitPrice.format()),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.shoppingSharing(item.peopleSharing),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.suggestionsClosed
                    ? context.l10n.shoppingSuggestionsClosed
                    : context.l10n.shoppingTotalCost,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                item.totalCost.format(),
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryPill extends StatelessWidget {
  const _CategoryPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

class _TotalCard extends StatelessWidget {
  const _TotalCard({required this.total});

  final Money total;

  @override
  Widget build(BuildContext context) {
    return KpCard.financial(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.shoppingEstimatedTotal,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(total.format(), style: context.textTheme.titleLarge),
        ],
      ),
    );
  }
}
