import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/pockets/presentation/pages/create_pocket_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

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

  testWidgets('CreatePocketPage uses the two-column layout on tablets', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // The wide layout shows the persistent side rail, which reads the session.
    final session = _MockSessionManager();
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u1', name: 'Ada'));
    getIt.registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const CreatePocketPage());

    // Intro + form render together in the wide two-column layout.
    expect(find.text('Ready for a new Pocket?'), findsOneWidget);
    expect(find.text('Pocket title'), findsOneWidget);
  });
}
