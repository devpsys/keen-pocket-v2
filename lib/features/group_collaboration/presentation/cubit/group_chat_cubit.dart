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
        author: 'Funke',
        text: 'Has everyone paid this month?',
        isMine: false,
      ),
      ChatMessageView(
        id: 'c2',
        author: 'You',
        text: 'Just sent mine 👍',
        isMine: true,
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
