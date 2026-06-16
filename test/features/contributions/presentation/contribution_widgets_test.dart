import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/contributions/domain/value_objects/contribution_context.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/contribute_button.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/pay_from_wallet_sheet.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('ContributeButton renders the contribute label', (tester) async {
    await tester.pumpApp(
      Scaffold(
        body: ContributeButton(target: ContributionContext.pocket('p1')),
      ),
    );
    expect(find.text('Contribute'), findsOneWidget);
  });

  group('PayFromWalletSheet', () {
    testWidgets('shows confirm state when balance is sufficient', (
      tester,
    ) async {
      await tester.pumpApp(
        Scaffold(
          body: PayFromWalletSheet(
            walletBalance: Money.naira(12500),
            invoiceAmount: Money.naira(5000),
          ),
        ),
      );

      expect(find.text('Confirm payment'), findsOneWidget);
      expect(find.text('New balance'), findsOneWidget);
      expect(find.textContaining('from wallet'), findsOneWidget);
    });

    testWidgets('shows insufficient state when balance is too low', (
      tester,
    ) async {
      await tester.pumpApp(
        Scaffold(
          body: PayFromWalletSheet(
            walletBalance: Money.naira(1200),
            invoiceAmount: Money.naira(5000),
          ),
        ),
      );

      expect(find.text('Insufficient balance'), findsOneWidget);
      expect(find.text('Top up wallet'), findsOneWidget);
    });
  });
}
