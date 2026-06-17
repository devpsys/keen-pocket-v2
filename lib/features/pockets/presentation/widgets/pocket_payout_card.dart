import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Primary-coloured card showing the pocket's payout bank account.
class PocketPayoutCard extends StatelessWidget {
  const PocketPayoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.primaryContainer,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_rounded,
                color: context.colorScheme.onPrimary,
                size: KpSpacing.l,
              ),
              const Gap.xs(horizontal: true),
              Text(
                context.l10n.pocketDetailPayoutAccount,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          const Gap.m(),
          Text(
            kPocketPayout.bank,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap.xxs(),
          Text(
            kPocketPayout.nuban,
            style: context.textTheme.headlineMedium?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap.xxs(),
          Text(
            kPocketPayout.holder,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
