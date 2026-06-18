import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/plans/presentation/pages/create_plan_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  setUp(() {
    final session = _MockSessionManager();
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u1', name: 'Ada'));
    getIt.registerSingleton<SessionManager>(session);
  });

  tearDown(getIt.reset);

  testWidgets('phone create-plan renders the form and submit bar', (
    tester,
  ) async {
    await tester.pumpApp(const CreatePlanPage());
    await tester.pumpAndSettle();

    expect(find.text('New Plan'), findsOneWidget);
    expect(find.text('Plan Title'), findsOneWidget);
    // Segmented period control + carry-over toggle.
    expect(find.text('Month'), findsOneWidget);
    expect(find.text('Year'), findsOneWidget);
    expect(find.text('Carry over deferred items'), findsOneWidget);
    expect(find.text('CREATE PLAN'), findsOneWidget);
  });

  testWidgets('tablet create-plan shows the cockpit actions', (tester) async {
    tester.view.physicalSize = const Size(1500, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const CreatePlanPage());
    await tester.pumpAndSettle();

    expect(find.text('Ready to save, Chef?'), findsOneWidget);
    expect(find.text('Create My Plan'), findsOneWidget);
    expect(find.text('Save Draft'), findsOneWidget);
  });
}
