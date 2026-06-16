import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/friends/presentation/view_models/friend_view.dart';

part 'friends_state.freezed.dart';

@freezed
abstract class FriendsState with _$FriendsState {
  const factory FriendsState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String inviteCode,
    @Default(<FriendView>[]) List<FriendView> connections,
  }) = _FriendsState;

  const FriendsState._();

  List<FriendView> get friends =>
      connections.where((c) => c.status == FriendStatus.friend).toList();
  List<FriendView> get incoming =>
      connections.where((c) => c.status == FriendStatus.incoming).toList();
  List<FriendView> get outgoing =>
      connections.where((c) => c.status == FriendStatus.outgoing).toList();
}
