import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/chat_message_view.dart';

/// Reusable group-chat panel (design `group_chat_panel`): brand header,
/// tucked-corner bubbles with timestamps, an input pill + send FAB, and an
/// empty state. Presentation-only — [onSend] receives the composed text.
class GroupChatPanel extends StatefulWidget {
  const GroupChatPanel({
    required this.messages,
    required this.onSend,
    this.membersOnline = 12,
    this.onClose,
    this.onStartChatting,
    super.key,
  });

  final List<ChatMessageView> messages;
  final ValueChanged<String> onSend;
  final int membersOnline;
  final VoidCallback? onClose;
  final VoidCallback? onStartChatting;

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
        _Header(online: widget.membersOnline, onClose: widget.onClose),
        Expanded(
          child: ColoredBox(
            color: context.colorScheme.surface,
            child: widget.messages.isEmpty
                ? _EmptyChat(onStart: widget.onStartChatting)
                : ListView(
                    padding: const EdgeInsets.all(KpSpacing.m),
                    children: [
                      const _TodayDivider(),
                      for (final m in widget.messages) _Bubble(message: m),
                    ],
                  ),
          ),
        ),
        _Composer(controller: _controller, onSend: _send),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.online, this.onClose});

  final int online;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.primary,
      elevation: 2,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(KpSpacing.m),
          child: Row(
            children: [
              CircleAvatar(
                radius: KpSpacing.l,
                backgroundColor: context.colorScheme.surfaceContainerLowest,
                child: Icon(
                  Icons.groups_rounded,
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.groupChatTitle,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                    Row(
                      children: [
                        const _OnlineDot(),
                        const Gap.xxs(horizontal: true),
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
              ),
              if (onClose != null)
                IconButton(
                  onPressed: onClose,
                  icon: Icon(
                    Icons.close_rounded,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnlineDot extends StatelessWidget {
  const _OnlineDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: KpSpacing.s,
      height: KpSpacing.s,
      decoration: BoxDecoration(
        color: context.colors.success,
        shape: BoxShape.circle,
        border: Border.all(color: context.colorScheme.onPrimary, width: 1),
      ),
    );
  }
}

class _TodayDivider extends StatelessWidget {
  const _TodayDivider();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: KpSpacing.s),
        padding: const EdgeInsets.symmetric(
          horizontal: KpSpacing.s,
          vertical: KpSpacing.xxs,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerHigh,
          borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        ),
        child: Text(
          context.l10n.groupChatToday.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            letterSpacing: 0.5,
          ),
        ),
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
    final authorColor = message.authorTint == ChatAuthorTint.secondary
        ? context.colorScheme.secondary
        : context.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(bottom: KpSpacing.m),
      child: Column(
        crossAxisAlignment: mine
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          if (!mine)
            Padding(
              padding: const EdgeInsets.only(
                left: KpSpacing.xs,
                bottom: KpSpacing.xxs,
              ),
              child: Text(
                message.author,
                style: context.textTheme.labelSmall?.copyWith(
                  color: authorColor,
                ),
              ),
            ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.78,
            ),
            child: Container(
              padding: const EdgeInsets.all(KpSpacing.s),
              decoration: BoxDecoration(
                color: mine
                    ? context.colorScheme.primary
                    : context.colorScheme.surfaceContainerLowest,
                borderRadius: radius,
                // Candy depth: a flat (blur-0) bottom shadow. Mine uses the
                // darker brand shade (same as KpButton primary); incoming a
                // soft neutral drop.
                border: mine
                    ? null
                    : Border.all(
                        color: context.colorScheme.surfaceContainerHighest,
                        width: 2,
                      ),
                boxShadow: [
                  BoxShadow(
                    color: mine
                        ? KpColors.brand600
                        : context.colorScheme.shadow.withValues(alpha: 0.1),
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: mine ? context.colorScheme.onPrimary : null,
                ),
              ),
            ),
          ),
          if (message.time.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                top: KpSpacing.xxs,
                left: KpSpacing.xs,
                right: KpSpacing.xs,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.time,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.outline,
                    ),
                  ),
                  if (mine) ...[
                    const Gap.xxs(horizontal: true),
                    Icon(
                      Icons.done_all_rounded,
                      size: KpSpacing.s,
                      color: context.colorScheme.primary,
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({required this.controller, required this.onSend});

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainerLowest,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(KpSpacing.m),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainerLowest,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(KpRadii.pill),
                    ),
                    border: Border.all(
                      color: context.colorScheme.surfaceContainerHighest,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_rounded,
                        color: context.colorScheme.outline,
                      ),
                      const Gap.xs(horizontal: true),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => onSend(),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            filled: false,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: KpSpacing.s,
                            ),
                            hintText: context.l10n.groupChatTypeMessage,
                            hintStyle: context.textTheme.bodyMedium?.copyWith(
                              color: context.colorScheme.outline,
                            ),
                          ),
                        ),
                      ),
                      const Gap.xs(horizontal: true),
                      Icon(
                        Icons.sentiment_satisfied_rounded,
                        color: context.colorScheme.outline,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap.s(horizontal: true),
              _SendButton(onSend: onSend),
            ],
          ),
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.onSend});

  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    // Candy depth: a flat bottom shadow under the circle (design `0 4px 0 0
    // #00405d`) rather than a full ring.
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: KpColors.brand600, offset: Offset(0, 4))],
      ),
      child: Material(
        color: context.colorScheme.primary,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onSend,
          child: Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            child: Icon(
              Icons.send_rounded,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyChat extends StatelessWidget {
  const _EmptyChat({this.onStart});

  final VoidCallback? onStart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const KpMascot(size: 96),
            const Gap.l(),
            Text(
              context.l10n.groupChatEmptyTitle,
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Gap.xs(),
            Text(
              context.l10n.groupChatEmptyMessage,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap.l(),
            KpButton(
              label: context.l10n.groupChatStartChatting,
              variant: KpButtonVariant.secondary,
              onPressed: onStart ?? () {},
            ),
          ],
        ),
      ),
    );
  }
}
