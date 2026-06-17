import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/pockets/presentation/pages/create_pocket_page.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('CreatePocketPage renders the form and gates submit on terms', (
    tester,
  ) async {
    await tester.pumpApp(const CreatePocketPage());

    expect(find.text('Ready for a new Pocket?'), findsOneWidget);
    expect(find.text('Pocket title'), findsOneWidget);

    // Terms + submit live at the bottom of a scrolling form.
    final scrollable = find.byType(Scrollable).first;
    await tester.scrollUntilVisible(
      find.byType(Checkbox),
      300,
      scrollable: scrollable,
    );
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    await tester.scrollUntilVisible(
      find.text('CREATE POCKET'),
      300,
      scrollable: scrollable,
    );
    await tester.tap(find.text('CREATE POCKET'));
    await tester.pumpAndSettle();
  });
}
