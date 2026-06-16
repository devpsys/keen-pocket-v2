import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_donate_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  final drive = CharityView(
    title: 'Relief Fund',
    goal: Money.naira(200000),
    raised: Money.naira(120000),
    donorCount: 24,
  );

  testWidgets('CharityDonateCard shows progress and reached percentage', (
    tester,
  ) async {
    await tester.pumpApp(
      Scaffold(
        body: SingleChildScrollView(child: CharityDonateCard(drive: drive)),
      ),
    );

    expect(find.text('Relief Fund'), findsOneWidget);
    expect(find.text('60% reached'), findsOneWidget);
    expect(find.text('Donate now'), findsOneWidget);
  });

  testWidgets('entering an amount and tapping donate fires onDonate', (
    tester,
  ) async {
    Money? donated;
    await tester.pumpApp(
      Scaffold(
        body: SingleChildScrollView(
          child: CharityDonateCard(drive: drive, onDonate: (m) => donated = m),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '5000');
    await tester.tap(find.text('Donate now'));
    await tester.pump();

    expect(donated, Money.naira(5000));
  });
}
