import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/trust/presentation/pages/vouches_inbox_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  testWidgets('renders requests and resolves one on Recommend', (tester) async {
    tester.view.physicalSize = const Size(600, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const VouchesInboxPage());
    await tester.pumpAndSettle();

    expect(find.text('Vouch Requests'), findsOneWidget);
    expect(find.text('Alex Miller'), findsOneWidget);
    expect(find.text('Sarah Chen'), findsOneWidget);

    // Recommend the first request -> it leaves the list.
    await tester.tap(find.text('RECOMMEND').first);
    await tester.pumpAndSettle();

    expect(find.text('Alex Miller'), findsNothing);
  });

  testWidgets('renders the tablet master-detail', (tester) async {
    tester.view.physicalSize = const Size(1500, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt.registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const VouchesInboxPage());
    await tester.pumpAndSettle();

    expect(find.text('Pending Vouchers (3)'), findsOneWidget);
    expect(find.text('REPUTATION SCORE'), findsOneWidget);
    expect(find.text('TRUST NETWORK'), findsOneWidget);
  });
}
