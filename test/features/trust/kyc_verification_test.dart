import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/trust/presentation/pages/kyc_verification_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  testWidgets('renders the KYC form and verifies', (tester) async {
    tester.view.physicalSize = const Size(600, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    var verified = false;
    await tester.pumpApp(
      Navigator(
        onGenerateRoute: (_) => MaterialPageRoute<void>(
          builder: (context) => TextButton(
            onPressed: () async {
              final result = await Navigator.of(context).push<bool>(
                MaterialPageRoute<bool>(
                  builder: (_) => const KycVerificationPage(),
                ),
              );
              verified = result ?? false;
            },
            child: const Text('open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Identity Check!'), findsOneWidget);
    expect(find.text('Verification Pending'), findsOneWidget);
    expect(find.text('Select ID Type'), findsOneWidget);

    await tester.tap(find.text('Verify Identity'));
    await tester.pumpAndSettle();

    expect(verified, isTrue);
  });

  testWidgets('renders the tablet identity layout', (tester) async {
    tester.view.physicalSize = const Size(1500, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt.registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const KycVerificationPage());
    await tester.pumpAndSettle();

    expect(find.text('Identity Check'), findsOneWidget);
    expect(find.text('AES-256 Encrypted'), findsOneWidget);
  });
}
