import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/pockets/presentation/view_models/shopping_item_view.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_shopping_section.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('PocketShoppingSection lists items and the estimated total', (
    tester,
  ) async {
    var suggested = false;
    await tester.pumpApp(
      Scaffold(
        body: SingleChildScrollView(
          child: PocketShoppingSection(
            estimatedTotal: Money.naira(27600),
            onSuggest: () => suggested = true,
            items: [
              ShoppingItemView(
                id: '1',
                name: 'Brioche Buns',
                category: 'Grains',
                unitPrice: Money.naira(1200),
                peopleSharing: 8,
                totalCost: Money.naira(9600),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Shopping list'), findsOneWidget);
    expect(find.text('Brioche Buns'), findsOneWidget);
    expect(find.text('Grains'), findsOneWidget);
    expect(find.text('Estimated group total'), findsOneWidget);

    await tester.tap(find.text('Suggest item'));
    await tester.pump();
    expect(suggested, isTrue);
  });
}
