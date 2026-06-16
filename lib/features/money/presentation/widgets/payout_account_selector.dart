import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/view_models/bank_account_view.dart';

/// Dropdown to pick the payout account for a pocket/adashi (map §3: `money`
/// piece composed into group settings). Presentation-only.
class PayoutAccountSelector extends StatelessWidget {
  const PayoutAccountSelector({
    required this.accounts,
    required this.selectedId,
    required this.onChanged,
    super.key,
  });

  final List<BankAccountView> accounts;
  final String? selectedId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedId,
      decoration: InputDecoration(labelText: context.l10n.moneyPayoutAccount),
      items: [
        for (final account in accounts)
          DropdownMenuItem<String>(
            value: account.id,
            child: Text('${account.bankName} · ${account.maskedNuban}'),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
