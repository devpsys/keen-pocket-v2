import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/profile/presentation/pages/public_profile_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  testWidgets('public profile renders identity, groups, ratings and legend', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(500, 3000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const PublicProfilePage());
    await tester.pumpAndSettle();

    expect(find.text('Amaka'), findsOneWidget);
    expect(find.text('Groups by Amaka'), findsOneWidget);
    expect(find.text('Decentralized Vacay'), findsOneWidget);
    expect(find.text('Ratings Received'), findsOneWidget);
    expect(find.text("You're a Legend, Amaka!"), findsOneWidget);
  });

  testWidgets('public profile renders the three-column tablet layout', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1500, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // The tablet shell shows the side rail, whose header reads the session.
    final session = _MockSessionManager();
    when(
      () => session.currentUser,
    ).thenReturn(const SessionUser(id: 'u1', name: 'Amaka', kycVerified: true));
    getIt.registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const PublicProfilePage());
    await tester.pumpAndSettle();

    expect(find.text('Groups by Amaka'), findsOneWidget);
    expect(find.text('TRUST SCORE'), findsOneWidget);
    expect(find.text('Reliable Payer'), findsOneWidget);
    expect(find.text('Top Organizer'), findsOneWidget);
    expect(find.text("You're a Legend, Amaka!"), findsOneWidget);
  });
}
