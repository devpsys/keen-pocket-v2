import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Beta "group shopping suggestions" card: a 2-up grid of votable items the
/// pocket could buy together.
class PocketGroupShoppingTablet extends StatelessWidget {
  const PocketGroupShoppingTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  context.l10n.pocketDetailGroupShoppingSuggestions,
                  style: context.textTheme.titleMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: KpSpacing.s,
                  vertical: KpSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: context.colorScheme.tertiaryContainer,
                  borderRadius: KpRadii.allM,
                ),
                child: Text(
                  context.l10n.pocketDetailBeta,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const Gap.m(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < kPocketGroupShopping.length; i++) ...[
                if (i > 0) const Gap.m(horizontal: true),
                Expanded(
                  child: _ShoppingItemCard(item: kPocketGroupShopping[i]),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// A single votable shopping item: image placeholder, name, group price and a
/// "Vote for Item" button.
class _ShoppingItemCard extends StatelessWidget {
  const _ShoppingItemCard({required this.item});

  static const double _imageHeight = 128;

  final PocketShoppingSuggestion item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: _imageHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLow,
              borderRadius: KpRadii.allM,
            ),
            child: Icon(
              KpIcons.shopping,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.s(),
          Text(item.name, style: context.textTheme.labelLarge),
          const Gap.xxs(),
          Text(
            context.l10n.pocketDetailGroupPriceShort(
              item.groupPrice.formatShort(),
            ),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.s(),
          KpButton(
            label: context.l10n.pocketDetailVoteForItem,
            variant: KpButtonVariant.ghost,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
