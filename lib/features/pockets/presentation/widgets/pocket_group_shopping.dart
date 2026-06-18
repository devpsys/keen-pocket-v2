import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Group-shopping suggestions section of the pocket detail hub: bulk items the
/// pocket can buy together at a shared price.
class PocketGroupShopping extends StatelessWidget {
  const PocketGroupShopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.pocketDetailGroupShopping,
          style: context.textTheme.titleLarge,
        ),
        const Gap.s(),
        for (final item in kPocketGroupShopping) ...[
          _GroupShoppingCard(item: item),
          const Gap.s(),
        ],
      ],
    );
  }
}

class _GroupShoppingCard extends StatelessWidget {
  const _GroupShoppingCard({required this.item});

  static const double _thumbSize = 64;

  final PocketShoppingSuggestion item;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        children: [
          Container(
            width: _thumbSize,
            height: _thumbSize,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              borderRadius: KpRadii.allM,
            ),
            child: Icon(
              KpIcons.shopping,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: context.textTheme.titleMedium),
                const Gap.xxs(),
                Text(
                  context.l10n.pocketDetailGroupPrice(item.groupPrice.format()),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  context.l10n.pocketDetailSharedBy(item.sharedBy),
                  style: context.textTheme.labelSmall?.copyWith(
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
