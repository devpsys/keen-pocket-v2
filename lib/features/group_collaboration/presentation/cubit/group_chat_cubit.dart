import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/group_collaboration/presentation/cubit/group_chat_state.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/chat_message_view.dart';

/// PRESENTATION-ONLY: placeholder chat; backend-gap, so the page is flag-gated
/// (built dark). Swap for a poll/stream use case when the API exists.
@injectable
class GroupChatCubit extends Cubit<GroupChatState> {
  GroupChatCubit() : super(const GroupChatState());

  var _seq = 0;

  Future<void> load(String groupId) async {
    emit(state.copyWith(status: StateStatus.loading));
    const messages = [
      ChatMessageView(
        id: 'c1',
        author: 'Sarah M.',
        text: "Hey everyone! We're only \$50 away from our vacation goal! 🏖️",
        isMine: false,
        time: '09:41 AM',
      ),
      ChatMessageView(
        id: 'c2',
        author: 'You',
        text: "Just added my contribution! We've got this! 🚀",
        isMine: true,
        time: '09:43 AM',
      ),
      ChatMessageView(
        id: 'c3',
        author: 'Marcus King',
        text:
            "Sweet! I'll put mine in tonight after work. "
            "Let's start looking at hotels! 🏨",
        isMine: false,
        time: '09:45 AM',
        authorTint: ChatAuthorTint.secondary,
      ),
    ];
    emit(state.copyWith(status: StateStatus.success, messages: messages));
  }

  void send(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    _seq++;
    emit(
      state.copyWith(
        messages: [
          ...state.messages,
          ChatMessageView(
            id: 'local-$_seq',
            author: 'You',
            text: trimmed,
            isMine: true,
          ),
        ],
      ),
    );
  }
}
