import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_donate_card.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_fixtures.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_setup_widgets.dart';

import '../../helpers/pump_app.dart';

void main() {
  final drive = CharityView(
    title: 'Relief Fund',
    goal: Money.naira(200000),
    raised: Money.naira(120000),
    donorCount: 24,
  );

  testWidgets('CharityFinancialCard shows progress and reached percentage', (
    tester,
  ) async {
    await tester.pumpApp(
      Scaffold(
        body: SingleChildScrollView(child: CharityFinancialCard(drive: drive)),
      ),
    );

    expect(find.text('Financial Goal'), findsOneWidget);
    expect(find.text('60% Reached'), findsOneWidget);
    expect(find.text('Donate Now'), findsOneWidget);
  });

  testWidgets('entering an amount and tapping donate fires onDonate', (
    tester,
  ) async {
    Money? donated;
    await tester.pumpApp(
      Scaffold(
        body: SingleChildScrollView(
          child: CharityFinancialCard(
            drive: drive,
            onDonate: (m) => donated = m,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '5000');
    await tester.tap(find.text('Donate Now'));
    await tester.pump();

    expect(donated, Money.naira(5000));
  });

  testWidgets('CharityResourceCard lists the resource goals', (tester) async {
    await tester.pumpApp(
      const Scaffold(
        body: SingleChildScrollView(
          child: CharityResourceCard(items: kCharityResources),
        ),
      ),
    );

    expect(find.text('Resource Goal'), findsOneWidget);
    expect(find.text('Food Packs'), findsOneWidget);
    expect(find.text('30 / 100'), findsOneWidget);
    expect(find.text('Pledge Items'), findsOneWidget);
  });

  testWidgets('CharityContributionsCard shows anonymised donors', (
    tester,
  ) async {
    await tester.pumpApp(
      Scaffold(
        body: SingleChildScrollView(
          child: CharityContributionsCard(contributions: kCharityContributions),
        ),
      ),
    );

    expect(find.text('Recent Contributions'), findsOneWidget);
    expect(find.text('A***'), findsOneWidget);
    expect(find.text('10 Food Packs'), findsOneWidget);
  });

  testWidgets('CharityGoalTypeToggle reports the selected type', (
    tester,
  ) async {
    CharityGoalType? picked;
    await tester.pumpApp(
      Scaffold(
        body: CharityGoalTypeToggle(
          selected: CharityGoalType.amount,
          onChanged: (t) => picked = t,
        ),
      ),
    );

    await tester.tap(find.text('Items'));
    await tester.pump();

    expect(picked, CharityGoalType.items);
  });
}
