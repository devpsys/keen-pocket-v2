import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_detail_page.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_list_page.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_card.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_tablet_card.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/rotation_timeline.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  setUp(() {
    // The cubits have no dependencies; register the real ones (sample-backed).
    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerFactory<AdashiListCubit>(AdashiListCubit.new)
      ..registerFactory<AdashiDetailCubit>(AdashiDetailCubit.new)
      ..registerSingleton<SessionManager>(session);
  });
  tearDown(() => getIt.reset());

  testWidgets('AdashiListPage renders the phone circle cards', (tester) async {
    await tester.pumpApp(const AdashiListPage());
    await tester.pumpAndSettle();

    expect(find.byType(AdashiCard), findsWidgets);
    expect(find.text('My Adashi Groups'), findsOneWidget);
    expect(find.text('Market Women Union'), findsOneWidget);
  });

  testWidgets('AdashiListPage reflows to the tablet card grid', (tester) async {
    tester.view.physicalSize = const Size(1500, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const AdashiListPage());
    await tester.pumpAndSettle();

    expect(find.byType(AdashiTabletCard), findsWidgets);
    expect(find.text('New Group'), findsOneWidget);
    expect(find.text('Join a Circle'), findsOneWidget);
    expect(find.text('Did you know?'), findsOneWidget);
  });

  testWidgets('AdashiDetailPage renders the hub (phone)', (tester) async {
    await tester.pumpApp(const AdashiDetailPage(adashiId: 'a1'));
    await tester.pumpAndSettle();

    // Top-of-page content (the rotation timeline sits below the fold; it is
    // covered directly in the widgets test).
    expect(find.text('Cycle 2'), findsOneWidget);
    expect(find.text('Yusuf G. (Admin)'), findsOneWidget);
    expect(find.text('Rate admin'), findsOneWidget);

    // Scroll down to confirm the rotation timeline builds.
    await tester.scrollUntilVisible(find.byType(RotationTimeline), 300);
    expect(find.byType(RotationTimeline), findsOneWidget);
  });

  testWidgets('AdashiDetailPage renders the tablet cockpit', (tester) async {
    tester.view.physicalSize = const Size(1500, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const AdashiDetailPage(adashiId: 'a1'));
    await tester.pumpAndSettle();

    expect(find.text('Adashi Hub'), findsOneWidget);
    expect(find.text('Master Organiser'), findsOneWidget);
    expect(find.text('Market Women Union'), findsOneWidget);
  });
}
