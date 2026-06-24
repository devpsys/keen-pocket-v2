import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/core/session/session_user.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/group_chat_cubit.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/group_chat_state.dart';
import 'package:keenpockets/features/group_collaboration/presentation/pages/group_chat_page.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/group_chat_tablet_view.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  group('GroupChatCubit', () {
    blocTest<GroupChatCubit, GroupChatState>(
      'load then send appends my message',
      build: GroupChatCubit.new,
      act: (cubit) async {
        await cubit.load('g1');
        cubit.send('hello');
      },
      verify: (cubit) {
        expect(cubit.state.messages.last.text, 'hello');
        expect(cubit.state.messages.last.isMine, isTrue);
      },
    );

    blocTest<GroupChatCubit, GroupChatState>(
      'send ignores blank input',
      build: GroupChatCubit.new,
      act: (cubit) async {
        await cubit.load('g1');
        cubit.send('   ');
      },
      verify: (cubit) => expect(cubit.state.messages.length, 3),
    );
  });

  group('GroupChatPage flag gating (backend-gap, built dark)', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when CHAT flag is OFF', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.chat: false}),
        )
        ..registerFactory<GroupChatCubit>(GroupChatCubit.new);

      await tester.pumpApp(const GroupChatPage(groupId: 'g1'));
      await tester.pumpAndSettle();

      expect(find.text('Coming soon'), findsOneWidget);
    });

    testWidgets('shows messages when the flag is ON', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.chat: true}),
        )
        ..registerFactory<GroupChatCubit>(GroupChatCubit.new);

      await tester.pumpApp(const GroupChatPage(groupId: 'g1'));
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Just added my contribution!'),
        findsOneWidget,
      );
    });

    testWidgets('uses the split-pane dashboard on tablet', (tester) async {
      tester.view.physicalSize = const Size(1600, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final session = _MockSessionManager();
      when(() => session.currentUser).thenReturn(
        const SessionUser(id: 'u1', name: 'Yusuf G.', kycVerified: true),
      );
      getIt
        ..registerSingleton<FeatureFlagService>(
          FeatureFlagService()..hydrate({Feature.chat: true}),
        )
        ..registerFactory<GroupChatCubit>(GroupChatCubit.new)
        ..registerSingleton<SessionManager>(session);

      await tester.pumpApp(const GroupChatPage(groupId: 'g1'));
      await tester.pumpAndSettle();

      expect(find.byType(GroupChatTabletView), findsOneWidget);
      // Chat-list pane, chat area and the (wide) group-info rail are all present.
      expect(find.text('Messages'), findsOneWidget);
      expect(find.text('Vacation Goal 🌴'), findsWidgets);
      expect(find.text('Circle Vital Stats'), findsOneWidget);
      expect(find.text('Shared Media'), findsOneWidget);
    });
  });
}
