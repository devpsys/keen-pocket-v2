import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/group_chat_cubit.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/group_chat_state.dart';
import 'package:keenpockets/features/group_collaboration/presentation/pages/group_chat_page.dart';

import '../../helpers/pump_app.dart';

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
      verify: (cubit) => expect(cubit.state.messages.length, 2),
    );
  });

  group('GroupChatPage flag gating (backend-gap, built dark)', () {
    tearDown(() => getIt.reset());

    testWidgets('shows coming-soon when CHAT flag is OFF', (tester) async {
      getIt
        ..registerSingleton<FeatureFlagService>(FeatureFlagService())
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

      expect(find.text('Just sent mine 👍'), findsOneWidget);
    });
  });
}
