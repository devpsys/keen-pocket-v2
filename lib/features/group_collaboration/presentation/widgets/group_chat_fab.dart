import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/presentation/pages/group_chat_page.dart';

/// Floating action button that opens the group chat for [groupId], with an
/// unread-count badge (map §3: docked on pocket/adashi detail).
class GroupChatFab extends StatelessWidget {
  const GroupChatFab({required this.groupId, this.unreadCount = 0, super.key});

  final String groupId;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    final fab = FloatingActionButton(
      heroTag: 'group_chat_$groupId',
      tooltip: context.l10n.groupChatTitle,
      onPressed: () => Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => GroupChatPage(groupId: groupId)),
      ),
      child: const Icon(Icons.chat_bubble_rounded),
    );
    if (unreadCount <= 0) return fab;
    return Badge.count(count: unreadCount, child: fab);
  }
}
