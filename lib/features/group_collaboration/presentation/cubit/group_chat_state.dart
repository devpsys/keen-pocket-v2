import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/group_collaboration/presentation/view_models/chat_message_view.dart';

part 'group_chat_state.freezed.dart';

@freezed
abstract class GroupChatState with _$GroupChatState {
  const factory GroupChatState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<ChatMessageView>[]) List<ChatMessageView> messages,
  }) = _GroupChatState;
}
