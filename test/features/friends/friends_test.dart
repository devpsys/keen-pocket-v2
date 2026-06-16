import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_cubit.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/pages/friends_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('FriendsCubit', () {
    blocTest<FriendsCubit, FriendsState>(
      'load splits connections into friends/incoming/outgoing',
      build: FriendsCubit.new,
      act: (cubit) => cubit.load(),
      verify: (cubit) {
        expect(cubit.state.friends, isNotEmpty);
        expect(cubit.state.incoming, isNotEmpty);
        expect(cubit.state.outgoing, isNotEmpty);
        expect(cubit.state.inviteCode, isNotEmpty);
      },
    );

    blocTest<FriendsCubit, FriendsState>(
      'accepting an incoming request moves it to friends',
      build: FriendsCubit.new,
      act: (cubit) async {
        await cubit.load();
        cubit.accept('f3'); // Dayo, incoming
      },
      verify: (cubit) {
        expect(cubit.state.incoming.any((f) => f.id == 'f3'), isFalse);
        expect(cubit.state.friends.any((f) => f.id == 'f3'), isTrue);
      },
    );
  });

  testWidgets('FriendsPage renders the invite block and a friend', (
    tester,
  ) async {
    getIt.registerFactory<FriendsCubit>(FriendsCubit.new);
    addTearDown(getIt.reset);

    await tester.pumpApp(const FriendsPage());
    await tester.pumpAndSettle();

    expect(find.text('Invite friends'), findsOneWidget);
    expect(find.text('Funke'), findsOneWidget);
  });
}
