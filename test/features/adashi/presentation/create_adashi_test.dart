import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/adashi/presentation/pages/create_adashi_page.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_create_forms.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  testWidgets('CreateAdashiPage renders the phone form + sticky submit', (
    tester,
  ) async {
    await tester.pumpApp(const CreateAdashiPage());
    await tester.pumpAndSettle();

    expect(find.byType(AdashiCreatePhoneForm), findsOneWidget);
    expect(find.text('Adashi Name'), findsOneWidget);
    expect(find.text("Let's set up your circle!"), findsOneWidget);
    expect(find.text('Create Adashi'), findsOneWidget);
  });

  testWidgets('CreateAdashiPage uses the two-pane tablet layout', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1500, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // The wide layout shows the persistent side rail, which reads the session.
    final session = _MockSessionManager();
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u1', name: 'Yusuf G.'));
    getIt.registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const CreateAdashiPage());
    await tester.pumpAndSettle();

    expect(find.byType(AdashiCreateTabletForm), findsOneWidget);
    expect(find.text('Create your Adashi'), findsOneWidget);
    expect(find.text('Payout Details'), findsOneWidget);
  });
}
