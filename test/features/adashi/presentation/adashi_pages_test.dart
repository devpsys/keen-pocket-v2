import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_list_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_manage_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_rotation_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_detail_page.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_list_page.dart';
import 'package:keenpockets/features/adashi/presentation/pages/adashi_rotation_page.dart';
import 'package:keenpockets/features/adashi/presentation/pages/manage_adashi_page.dart';
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
      ..registerFactory<AdashiRotationCubit>(AdashiRotationCubit.new)
      ..registerFactory<AdashiManageCubit>(AdashiManageCubit.new)
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

  testWidgets('AdashiRotationPage uses the tablet console', (tester) async {
    tester.view.physicalSize = const Size(1500, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const AdashiRotationPage(adashiId: 'a1'));
    await tester.pumpAndSettle();

    expect(find.text('Rotation Order'), findsOneWidget);
    expect(find.text('Transaction Log'), findsOneWidget);
    expect(find.text('Chinedu O.'), findsOneWidget);
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

  testWidgets('AdashiRotationPage renders the pot, cycles and members', (
    tester,
  ) async {
    await tester.pumpApp(const AdashiRotationPage(adashiId: 'a1'));
    await tester.pumpAndSettle();

    expect(find.text('Adashi: Weekly Groceries'), findsOneWidget);
    expect(find.text('CURRENT POT'), findsOneWidget);
    expect(find.text('Rotation Order'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Members'), 300);
    expect(find.text('Chinedu O.'), findsOneWidget);
  });

  testWidgets('ManageAdashiPage renders the members, verify and overrides', (
    tester,
  ) async {
    await tester.pumpApp(const ManageAdashiPage(adashiId: 'a1'));
    await tester.pumpAndSettle();

    expect(find.text('Circle Members'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Admin Overrides'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Set Receiver'), findsOneWidget);
  });

  testWidgets('ManageAdashiPage uses the tablet cockpit', (tester) async {
    tester.view.physicalSize = const Size(1500, 2600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpApp(const ManageAdashiPage(adashiId: 'a1'));
    await tester.pumpAndSettle();

    expect(find.text('Manage Adashi'), findsOneWidget);
    expect(find.text('Circle: Wealth Creators 2024'), findsOneWidget);
    expect(find.text('Verify Payments'), findsOneWidget);
  });
}
