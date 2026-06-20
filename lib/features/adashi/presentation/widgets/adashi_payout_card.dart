import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Payout account card (design `adashi_hub`): a bank glyph, the masked account
/// and an Edit action.
class AdashiPayoutCard extends StatelessWidget {
  const AdashiPayoutCard({required this.bank, this.onEdit, super.key});

  final String bank;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          Container(
            width: KpSpacing.xxl,
            height: KpSpacing.xxl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLowest,
              borderRadius: KpRadii.allM,
              border: Border.all(color: context.colorScheme.outlineVariant),
            ),
            child: Icon(
              Icons.account_balance_rounded,
              color: context.colorScheme.primary,
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.adashiHubPayoutAccount,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(bank, style: context.textTheme.labelLarge),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: onEdit,
            icon: Text(
              context.l10n.adashiHubEdit,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            label: Icon(
              KpIcons.edit,
              size: KpSpacing.m,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
