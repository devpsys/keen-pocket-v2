import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/contributions/domain/entities/invoice.dart';
import 'package:keenpockets/features/contributions/presentation/widgets/invoice_tile.dart';

import '../../../helpers/pump_app.dart';

void main() {
  const pending = Invoice(id: 'i1', contributorId: 'u1', total: Money(500000));

  testWidgets('shows amount and status; verify action fires when provided', (
    tester,
  ) async {
    var verified = false;
    await tester.pumpApp(
      Scaffold(
        body: InvoiceTile(invoice: pending, onVerify: () => verified = true),
      ),
    );

    expect(find.text('₦5,000.00'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);

    await tester.tap(find.text('Verify'));
    expect(verified, isTrue);
  });

  testWidgets('hides verify action when not provided', (tester) async {
    await tester.pumpApp(const Scaffold(body: InvoiceTile(invoice: pending)));
    expect(find.text('Verify'), findsNothing);
  });
}
