import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/view_models/bank_account_view.dart';

/// List of payout/collection bank accounts (map §3: hosted by `money`, embedded
/// on pocket/profile surfaces). Presentation-only: [onEdit] receives the
/// account id.
class BankAccountsList extends StatelessWidget {
  const BankAccountsList({required this.accounts, this.onEdit, super.key});

  final List<BankAccountView> accounts;
  final ValueChanged<String>? onEdit;

  @override
  Widget build(BuildContext context) {
    if (accounts.isEmpty) {
      return Text(context.l10n.moneyNoAccounts);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final account in accounts) ...[
          _BankAccountCard(account: account, onEdit: onEdit),
          const Gap.s(),
        ],
      ],
    );
  }
}

class _BankAccountCard extends StatelessWidget {
  const _BankAccountCard({required this.account, this.onEdit});

  final BankAccountView account;
  final ValueChanged<String>? onEdit;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(account.label, style: context.textTheme.titleMedium),
                    Text(
                      account.subtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (onEdit != null)
                IconButton(
                  tooltip: context.l10n.moneyEditAccount,
                  icon: Icon(
                    Icons.edit_rounded,
                    color: context.colorScheme.primary,
                  ),
                  onPressed: () => onEdit!(account.id),
                ),
            ],
          ),
          const Divider(),
          _Row(label: context.l10n.moneyBankLabel, value: account.bankName),
          const Gap.xs(),
          _Row(label: context.l10n.moneyNubanLabel, value: account.maskedNuban),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(value, style: context.textTheme.titleMedium),
      ],
    );
  }
}
