import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/view_models/friend_view.dart';

/// PRESENTATION-ONLY: placeholder social graph + invite code; swap for use cases.
@injectable
class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit() : super(const FriendsState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    const connections = [
      FriendView(id: 'f1', name: 'Funke', status: FriendStatus.friend),
      FriendView(id: 'f2', name: 'Chidi', status: FriendStatus.friend),
      FriendView(id: 'f3', name: 'Dayo', status: FriendStatus.incoming),
      FriendView(id: 'f4', name: 'Efe', status: FriendStatus.outgoing),
    ];
    emit(
      state.copyWith(
        status: StateStatus.success,
        inviteCode: 'KEEN-AD4',
        connections: connections,
      ),
    );
  }

  /// Accept an incoming request → becomes a friend.
  void accept(String id) => _setStatus(id, FriendStatus.friend);

  /// Decline/remove a connection.
  void remove(String id) => emit(
    state.copyWith(
      connections: state.connections.where((c) => c.id != id).toList(),
    ),
  );

  void _setStatus(String id, FriendStatus status) => emit(
    state.copyWith(
      connections: [
        for (final c in state.connections)
          if (c.id == id)
            FriendView(id: c.id, name: c.name, status: status)
          else
            c,
      ],
    ),
  );
}
