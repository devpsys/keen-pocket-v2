import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/pages/friends_page.dart';
import 'package:keenpockets/features/friends/presentation/widgets/refer_earn_tablet_widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  group('FriendsCubit', () {
    blocTest<FriendsCubit, FriendsState>(
      'loads the referral code, stats and circle',
      build: FriendsCubit.new,
      act: (cubit) => cubit.load(),
      verify: (cubit) {
        expect(cubit.state.status, StateStatus.success);
        expect(cubit.state.referralCode, isNotEmpty);
        expect(cubit.state.invited, 8);
        expect(cubit.state.circle, isNotEmpty);
      },
    );
  });

  testWidgets('phone renders the invite card, stats and circle', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(420, 1800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    getIt.registerFactory<FriendsCubit>(FriendsCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const FriendsPage());
    await tester.pumpAndSettle();

    expect(find.text('Your Invite Link'), findsOneWidget);
    expect(find.text('KEEN-9921'), findsOneWidget);
    expect(find.text('Your Circle'), findsOneWidget);
    expect(find.text('Tunde Adebayo'), findsOneWidget);
  });

  testWidgets('tablet uses the two-column dashboard', (tester) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final session = _MockSessionManager();
    when(() => session.currentUser).thenReturn(
      const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
    );
    getIt
      ..registerFactory<FriendsCubit>(FriendsCubit.new)
      ..registerSingleton<SessionManager>(session);
    addTearDown(getIt.reset);

    await tester.pumpApp(const FriendsPage());
    await tester.pumpAndSettle();

    expect(find.byType(ReferEarnTabletView), findsOneWidget);
    expect(find.text('Share on WhatsApp'), findsOneWidget);
    expect(find.text('Invite More Friends'), findsOneWidget);
  });
}
