import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_card.dart';

import '../../../helpers/pump_app.dart';

void main() {
  const pocket = Pocket(
    id: 'p1',
    name: 'Rent Pocket',
    organiserId: 'u1',
    handPrice: Money(500000),
    totalHands: 10,
    filledHands: 4,
    memberCount: 4,
  );

  testWidgets('renders name and formatted hand price; fires onTap', (
    tester,
  ) async {
    var tapped = false;
    await tester.pumpApp(
      Scaffold(
        body: PocketCard(pocket: pocket, onTap: () => tapped = true),
      ),
    );

    expect(find.text('Rent Pocket'), findsOneWidget);
    expect(find.text('₦5,000.00'), findsOneWidget);

    await tester.tap(find.byType(PocketCard));
    expect(tapped, isTrue);
  });
}
