import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_card.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/rotation_timeline.dart';

import '../../../helpers/pump_app.dart';

void main() {
  const summary = AdashiSummaryView(
    id: 'a1',
    name: 'Family Circle',
    perCycle: Money(2000000),
    memberCount: 6,
    currentCycle: 3,
    totalCycles: 6,
    mode: RotationMode.auto,
  );

  testWidgets('AdashiCard shows name, amount, and fires onTap', (tester) async {
    var tapped = false;
    await tester.pumpApp(
      Scaffold(
        body: AdashiCard(adashi: summary, onTap: () => tapped = true),
      ),
    );

    expect(find.text('Family Circle'), findsOneWidget);
    expect(find.text('₦20,000.00'), findsOneWidget);

    await tester.tap(find.byType(AdashiCard));
    expect(tapped, isTrue);
  });

  testWidgets('RotationTimeline renders a row per member with status labels', (
    tester,
  ) async {
    const members = [
      AdashiMemberView(
        id: 'm1',
        name: 'Ada',
        position: 1,
        status: RotationStatus.received,
      ),
      AdashiMemberView(
        id: 'm2',
        name: 'Bem',
        position: 2,
        status: RotationStatus.current,
      ),
      AdashiMemberView(
        id: 'm3',
        name: 'Chidi',
        position: 3,
        status: RotationStatus.upcoming,
      ),
    ];

    await tester.pumpApp(
      const Scaffold(
        body: SingleChildScrollView(child: RotationTimeline(members: members)),
      ),
    );

    expect(find.text('1. Ada'), findsOneWidget);
    expect(find.text('2. Bem'), findsOneWidget);
    expect(find.text('Received'), findsOneWidget);
    expect(find.text('Receiving'), findsOneWidget);
    expect(find.text('Upcoming'), findsOneWidget);
  });
}
