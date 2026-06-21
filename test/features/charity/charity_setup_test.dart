import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/charity/presentation/pages/charity_setup_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  testWidgets('renders the setup form and saves', (tester) async {
    var saved = false;
    await tester.pumpApp(
      Navigator(
        onGenerateRoute: (_) => MaterialPageRoute<void>(
          builder: (context) => TextButton(
            onPressed: () async {
              final result = await Navigator.of(context).push<bool>(
                MaterialPageRoute<bool>(
                  builder: (_) => const CharitySetupPage(),
                ),
              );
              saved = result ?? false;
            },
            child: const Text('open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Mr. K'), findsOneWidget);
    expect(find.text('Drive Title'), findsOneWidget);
    expect(find.textContaining('Target Amount'), findsOneWidget);

    await tester.ensureVisible(find.text('Save Drive'));
    await tester.tap(find.text('Save Drive'));
    await tester.pumpAndSettle();

    expect(saved, isTrue);
  });

  testWidgets('tablet shows the form and live preview', (tester) async {
    tester.view.physicalSize = const Size(1500, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt.registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const CharitySetupPage());
    await tester.pumpAndSettle();

    expect(find.text('Create Your Drive'), findsOneWidget);
    expect(find.text('LIVE PREVIEW'), findsOneWidget);
    expect(find.text('Launch Charity Drive'), findsOneWidget);
  });
}
