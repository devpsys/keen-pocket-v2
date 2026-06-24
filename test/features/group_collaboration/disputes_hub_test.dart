import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/disputes_hub_cubit.dart';
import 'package:keenpockets/features/group_collaboration/presentation/pages/disputes_hub_page.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/disputes_hub_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  setUp(() {
    getIt.registerFactory<DisputesHubCubit>(DisputesHubCubit.new);
  });
  tearDown(() => getIt.reset());

  testWidgets('phone hub shows the summary and case list', (tester) async {
    await tester.pumpApp(const DisputesHubPage(groupId: 'g1'));
    await tester.pumpAndSettle();

    expect(find.text('Disputes'), findsOneWidget);
    expect(find.text('2 Open'), findsOneWidget); // d1 + d4 are open
    expect(find.text('Duplicate Entry'), findsOneWidget);
    expect(find.text('12'), findsOneWidget); // resolved this month
  });

  testWidgets('admin view reveals the resolution actions', (tester) async {
    await tester.pumpApp(const DisputesHubPage(groupId: 'g1'));
    await tester.pumpAndSettle();

    expect(find.text('Resolve Case'), findsNothing);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(find.text('Resolve Case'), findsWidgets);
  });

  testWidgets('tablet uses the master-detail layout', (tester) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt.registerSingleton<SessionManager>(session);

    await tester.pumpApp(const DisputesHubPage(groupId: 'g1'));
    // Not pumpAndSettle: Mr. K's advice card runs a looping bounce animation.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.byType(DisputesHubTabletView), findsOneWidget);
    expect(find.text('Disputes Hub'), findsOneWidget);
    expect(find.text('Active Investigation'), findsOneWidget);
    expect(find.text('CASE TIMELINE'), findsOneWidget);
  });
}
