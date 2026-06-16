import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/legal/presentation/pages/legal_document_page.dart';
import 'package:keenpockets/features/legal/presentation/pages/legal_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('LegalPage lists Terms, Privacy and Delete account', (
    tester,
  ) async {
    await tester.pumpApp(const LegalPage());

    expect(find.text('Terms of Service'), findsOneWidget);
    expect(find.text('Privacy Policy'), findsOneWidget);
    expect(find.text('Delete account'), findsOneWidget);
  });

  testWidgets('Delete account shows a confirmation dialog', (tester) async {
    await tester.pumpApp(const LegalPage());

    await tester.tap(find.text('Delete account'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('LegalDocumentPage renders its title', (tester) async {
    await tester.pumpApp(const LegalDocumentPage(title: 'Terms of Service'));
    expect(find.text('Terms of Service'), findsOneWidget);
  });
}
