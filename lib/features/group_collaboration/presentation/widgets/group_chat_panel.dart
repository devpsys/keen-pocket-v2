import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/chat_message_view.dart';

/// Reusable group-chat panel (map §3: docked on tablet, shown full-screen on
/// phone). Renders tucked-corner bubbles — asymmetric radii that point to the
/// sender — and an empty state. Presentation-only: [onSend] is invoked with the
/// composed text.
class GroupChatPanel extends StatefulWidget {
  const GroupChatPanel({
    required this.messages,
    required this.onSend,
    this.membersOnline,
    super.key,
  });

  final List<ChatMessageView> messages;
  final ValueChanged<String> onSend;
  final int? membersOnline;

  @override
  State<GroupChatPanel> createState() => _GroupChatPanelState();
}

class _GroupChatPanelState extends State<GroupChatPanel> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.membersOnline != null)
          _Header(online: widget.membersOnline!),
        Expanded(
          child: widget.messages.isEmpty
              ? const _EmptyChat()
              : ListView.builder(
                  padding: const EdgeInsets.all(KpSpacing.m),
                  itemCount: widget.messages.length,
                  itemBuilder: (context, i) =>
                      _Bubble(message: widget.messages[i]),
                ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.s),
            child: Row(
              children: [
                Expanded(
                  child: KpTextField(
                    label: context.l10n.groupChatHint,
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onChanged: (_) {},
                  ),
                ),
                const Gap.xs(horizontal: true),
                IconButton.filled(
                  onPressed: _send,
                  icon: const Icon(Icons.send_rounded),
                  tooltip: context.l10n.groupChatSend,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.online});

  final int online;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(KpSpacing.s),
      color: context.colorScheme.primary,
      child: Row(
        children: [
          Icon(Icons.groups_rounded, color: context.colorScheme.onPrimary),
          const Gap.xs(horizontal: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.groupChatTitle,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
              Text(
                context.l10n.groupChatMembersOnline(online),
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});

  final ChatMessageView message;

  @override
  Widget build(BuildContext context) {
    final mine = message.isMine;
    // Tucked corners: the corner nearest the sender is squared off.
    final radius = BorderRadius.only(
      topLeft: KpRadii.radiusL,
      topRight: KpRadii.radiusL,
      bottomLeft: mine ? KpRadii.radiusL : KpRadii.radiusXs,
      bottomRight: mine ? KpRadii.radiusXs : KpRadii.radiusL,
    );
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: mine
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!mine)
            Padding(
              padding: const EdgeInsets.only(left: KpSpacing.xs),
              child: Text(
                message.author,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: KpSpacing.xxs),
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.s,
              vertical: KpSpacing.xs,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.72,
            ),
            decoration: BoxDecoration(
              color: mine
                  ? context.colorScheme.primary
                  : context.colorScheme.surfaceContainerHighest,
              borderRadius: radius,
            ),
            child: Text(
              message.text,
              style: context.textTheme.bodyMedium?.copyWith(
                color: mine ? context.colorScheme.onPrimary : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyChat extends StatelessWidget {
  const _EmptyChat();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const KpMascot.search(size: 96),
            const Gap.m(),
            Text(
              context.l10n.groupChatEmptyTitle,
              style: context.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const Gap.xs(),
            Text(
              context.l10n.groupChatEmptyMessage,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
