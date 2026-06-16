import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/money/presentation/view_models/bank_account_view.dart';
import 'package:keenpockets/features/money/presentation/widgets/bank_accounts_list.dart';
import 'package:keenpockets/features/money/presentation/widgets/payout_account_selector.dart';

import '../../helpers/pump_app.dart';

const _accounts = [
  BankAccountView(
    id: '1',
    label: 'Emergency Fund',
    subtitle: 'Primary Savings',
    bankName: 'Zenith Bank',
    maskedNuban: '**** 5521',
  ),
];

void main() {
  testWidgets('BankAccountsList renders an account and fires onEdit', (
    tester,
  ) async {
    String? edited;
    await tester.pumpApp(
      Scaffold(
        body: BankAccountsList(
          accounts: _accounts,
          onEdit: (id) => edited = id,
        ),
      ),
    );

    expect(find.text('Emergency Fund'), findsOneWidget);
    expect(find.text('Zenith Bank'), findsOneWidget);
    expect(find.text('**** 5521'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.edit_rounded));
    await tester.pump();
    expect(edited, '1');
  });

  testWidgets('PayoutAccountSelector lists accounts and reports selection', (
    tester,
  ) async {
    String? selected;
    await tester.pumpApp(
      Scaffold(
        body: PayoutAccountSelector(
          accounts: _accounts,
          selectedId: null,
          onChanged: (id) => selected = id,
        ),
      ),
    );

    await tester.tap(find.byType(PayoutAccountSelector));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Zenith Bank').last);
    await tester.pumpAndSettle();
    expect(selected, '1');
  });
}
