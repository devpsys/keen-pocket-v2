import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/school/presentation/pages/create_school_page.dart';
import 'package:keenpockets/features/school/presentation/widgets/create_school_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  tearDown(() => getIt.reset());

  testWidgets('shows coming-soon when the school flag is OFF', (tester) async {
    getIt.registerSingleton<FeatureFlagService>(FeatureFlagService());

    await tester.pumpApp(const CreateSchoolPage());
    await tester.pumpAndSettle();

    expect(find.text('Coming soon'), findsOneWidget);
    expect(find.text('School Identity'), findsNothing);
  });

  testWidgets('phone shows the form when the flag is ON', (tester) async {
    tester.view.physicalSize = const Size(500, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    getIt.registerSingleton<FeatureFlagService>(
      FeatureFlagService()..hydrate({Feature.school: true}),
    );

    await tester.pumpApp(const CreateSchoolPage());
    await tester.pumpAndSettle();

    expect(find.text('Build Your School!'), findsOneWidget);
    expect(find.text('School Identity'), findsOneWidget);
    expect(find.text('Payout Details'), findsOneWidget);
  });

  testWidgets('tablet shows the live preview when the flag is ON', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerSingleton<FeatureFlagService>(
        FeatureFlagService()..hydrate({Feature.school: true}),
      )
      ..registerSingleton<SessionManager>(session);

    await tester.pumpApp(const CreateSchoolPage());
    await tester.pumpAndSettle();

    expect(find.byType(CreateSchoolTabletView), findsOneWidget);
    expect(find.text('Live Preview'), findsOneWidget);
  });
}
