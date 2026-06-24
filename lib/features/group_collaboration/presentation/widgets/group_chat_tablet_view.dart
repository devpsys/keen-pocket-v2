import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/group_collaboration/presentation/group_chat_fixtures.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/chat_message_view.dart';

/// Tablet group-chat dashboard (design `group_chat_tablet`): a split pane with
/// the conversation list, the active chat area, and a group-info rail. The
/// persistent nav rail is provided by `AppTabletShell`, so this replaces the
/// mockup's bespoke SideNavBar. Presentation-only.
class GroupChatTabletView extends StatelessWidget {
  const GroupChatTabletView({
    required this.messages,
    required this.onSend,
    super.key,
  });

  final List<ChatMessageView> messages;
  final ValueChanged<String> onSend;

  static const double _paneWidth = 320;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // The group-info rail only fits once there is room beyond the two
        // primary panes (design hides it below the `xl` breakpoint).
        final showInfoRail = constraints.maxWidth >= 1180;
        return Row(
          children: [
            const SizedBox(width: _paneWidth, child: _ChatListPane()),
            Expanded(
              child: _ChatArea(messages: messages, onSend: onSend),
            ),
            if (showInfoRail)
              const SizedBox(width: _paneWidth, child: _GroupInfoRail()),
          ],
        );
      },
    );
  }
}

// ── Left: conversation list ─────────────────────────────────────────────────
class _ChatListPane extends StatelessWidget {
  const _ChatListPane();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          right: BorderSide(color: context.colorScheme.outlineVariant),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(KpSpacing.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.groupChatMessages,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.m(),
                const _SearchField(),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(KpSpacing.xs),
              itemCount: kGroupChatThreads.length,
              separatorBuilder: (_, _) => const Gap.xxs(),
              itemBuilder: (_, i) => _ThreadTile(thread: kGroupChatThreads[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colorScheme.surfaceContainer,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: context.colorScheme.outline,
        ),
        hintText: context.l10n.groupChatFindGroup,
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.outline,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
        border: const OutlineInputBorder(
          borderRadius: KpRadii.allL,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: KpRadii.allL,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: KpRadii.allL,
          borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}

class _ThreadTile extends StatelessWidget {
  const _ThreadTile({required this.thread});

  final ChatThread thread;

  @override
  Widget build(BuildContext context) {
    final active = thread.active;
    final fg = active
        ? context.colorScheme.onPrimaryContainer
        : context.colorScheme.onSurface;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: active ? context.colorScheme.primaryContainer : null,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: active
                    ? context.colorScheme.primary
                    : context.colorScheme.surfaceContainerHighest,
                width: 2,
              ),
            ),
            child: KpNetworkAvatar(url: thread.avatarUrl, radius: KpSpacing.l),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        thread.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: fg,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      thread.time,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: active
                            ? fg.withValues(alpha: 0.7)
                            : context.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                const Gap.xxs(),
                Text(
                  thread.preview,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: active
                        ? fg.withValues(alpha: 0.8)
                        : context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (thread.unread > 0) ...[
            const Gap.xs(horizontal: true),
            _UnreadBadge(count: thread.unread),
          ],
        ],
      ),
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: KpSpacing.l,
      height: KpSpacing.l,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$count',
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onPrimary,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

// ── Centre: active chat ─────────────────────────────────────────────────────
class _ChatArea extends StatefulWidget {
  const _ChatArea({required this.messages, required this.onSend});

  final List<ChatMessageView> messages;
  final ValueChanged<String> onSend;

  @override
  State<_ChatArea> createState() => _ChatAreaState();
}

class _ChatAreaState extends State<_ChatArea> {
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
    return ColoredBox(
      color: context.colorScheme.surface,
      child: Column(
        children: [
          const _ChatTopBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(KpSpacing.xl),
              children: [
                const Center(child: _DateChip()),
                const Gap.l(),
                for (final m in widget.messages) ...[
                  _TabletBubble(message: m),
                  const Gap.l(),
                ],
                const _MascotTyping(),
              ],
            ),
          ),
          _Composer(controller: _controller, onSend: _send),
        ],
      ),
    );
  }
}

class _ChatTopBar extends StatelessWidget {
  const _ChatTopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: KpSpacing.xl),
      height: 80,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kGroupChatActiveTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  kGroupChatActiveSubtitle,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const _SquareIconButton(icon: Icons.call_rounded),
          const Gap.s(horizontal: true),
          const _SquareIconButton(icon: Icons.more_vert_rounded),
        ],
      ),
    );
  }
}

class _SquareIconButton extends StatelessWidget {
  const _SquareIconButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainer,
      borderRadius: KpRadii.allM,
      child: InkWell(
        borderRadius: KpRadii.allM,
        onTap: () {},
        child: Container(
          width: KpSpacing.xl,
          height: KpSpacing.xl,
          alignment: Alignment.center,
          child: Icon(icon, color: context.colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  const _DateChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.m,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        context.l10n.groupChatToday.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _TabletBubble extends StatelessWidget {
  const _TabletBubble({required this.message});

  final ChatMessageView message;

  static const double _avatar = 40;

  @override
  Widget build(BuildContext context) {
    final mine = message.isMine;
    final radius = BorderRadius.only(
      topLeft: KpRadii.radiusXl,
      topRight: KpRadii.radiusXl,
      bottomLeft: mine ? KpRadii.radiusXl : KpRadii.radiusXs,
      bottomRight: mine ? KpRadii.radiusXs : KpRadii.radiusXl,
    );

    final bubble = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width * 0.45,
      ),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.m),
        decoration: BoxDecoration(
          color: mine
              ? context.colorScheme.primary
              : context.colorScheme.surfaceContainerHigh,
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: mine
                  ? KpColors.brand600
                  : context.colorScheme.surfaceContainerHighest,
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
    );

    if (mine) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(child: bubble),
          const Gap.m(horizontal: true),
          const _MyAvatarTile(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: KpRadii.allM,
          child: KpNetworkImage(
            url: message.avatarUrl ?? '',
            width: _avatar,
            height: _avatar,
          ),
        ),
        const Gap.m(horizontal: true),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: KpSpacing.xxs,
                  bottom: KpSpacing.xxs,
                ),
                child: Text(
                  message.author,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              bubble,
            ],
          ),
        ),
      ],
    );
  }
}

class _MyAvatarTile extends StatelessWidget {
  const _MyAvatarTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _TabletBubble._avatar,
      height: _TabletBubble._avatar,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allM,
      ),
      child: Icon(
        Icons.person_rounded,
        color: context.colorScheme.onSecondaryContainer,
      ),
    );
  }
}

class _MascotTyping extends StatelessWidget {
  const _MascotTyping();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: _TabletBubble._avatar,
          height: _TabletBubble._avatar,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.face_rounded, color: context.colorScheme.primary),
        ),
        const Gap.s(horizontal: true),
        for (var i = 0; i < 3; i++) ...[
          Container(
            width: KpSpacing.xs,
            height: KpSpacing.xs,
            decoration: BoxDecoration(
              color: context.colorScheme.outlineVariant,
              shape: BoxShape.circle,
            ),
          ),
          const Gap.xxs(horizontal: true),
        ],
        const Gap.xs(horizontal: true),
        Text(
          context.l10n.groupChatMascotTyping,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({required this.controller, required this.onSend});

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.l),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.s,
            vertical: KpSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
            border: Border.all(
              color: context.colorScheme.surfaceContainerHighest,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.add_rounded, color: context.colorScheme.primary),
              const Gap.s(horizontal: true),
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
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: KpRadii.allM,
        boxShadow: [BoxShadow(color: KpColors.brand600, offset: Offset(0, 4))],
      ),
      child: Material(
        color: context.colorScheme.primary,
        borderRadius: KpRadii.allM,
        child: InkWell(
          borderRadius: KpRadii.allM,
          onTap: onSend,
          child: Container(
            width: KpSpacing.xl,
            height: KpSpacing.xl,
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

// ── Right: group info ───────────────────────────────────────────────────────
class _GroupInfoRail extends StatelessWidget {
  const _GroupInfoRail();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          left: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          _VitalStatsSection(),
          _MembersSection(),
          _SharedMediaSection(),
          _MascotWidget(),
          Gap.xl(),
        ],
      ),
    );
  }
}

class _RailTitle extends StatelessWidget {
  const _RailTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        color: context.colorScheme.primary,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _VitalStatsSection extends StatelessWidget {
  const _VitalStatsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xl),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RailTitle(context.l10n.groupChatCircleVitalStats),
          const Gap.l(),
          const _ProgressCard(),
          const Gap.l(),
          const _NextRotationCard(),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard();

  @override
  Widget build(BuildContext context) {
    final pct = (kGroupChatPayoutProgress * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.surfaceContainerHighest,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.groupChatPayoutProgress,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Gap.s(horizontal: true),
              Text(
                '$pct%',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(
            value: kGroupChatPayoutProgress,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _NextRotationCard extends StatelessWidget {
  const _NextRotationCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(KpSpacing.m),
          decoration: BoxDecoration(
            borderRadius: KpRadii.allL,
            border: Border.all(color: context.colorScheme.primary, width: 2),
          ),
          child: Row(
            children: [
              const KpNetworkAvatar(
                url: kGroupChatNextAvatar,
                radius: KpSpacing.l,
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kGroupChatNextName,
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Gap.xxs(),
                    Text(
                      kGroupChatNextPayout,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.xs,
              vertical: KpSpacing.xxs,
            ),
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: KpRadii.radiusM,
                topRight: KpRadii.radiusL,
              ),
            ),
            child: Text(
              context.l10n.groupChatNext,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MembersSection extends StatelessWidget {
  const _MembersSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KpSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _RailTitle(context.l10n.groupChatMembers)),
              const Gap.s(horizontal: true),
              Text(
                context.l10n.groupChatViewAll,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const Gap.l(),
          for (final m in kGroupChatMembers) ...[
            _MemberRow(member: m),
            const Gap.m(),
          ],
        ],
      ),
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow({required this.member});

  final GroupMember member;

  static const double _size = 40;

  @override
  Widget build(BuildContext context) {
    final avatar = member.avatarUrl != null
        ? KpNetworkAvatar(url: member.avatarUrl!, radius: _size / 2)
        : Container(
            width: _size,
            height: _size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Text(
              member.initial ?? '',
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
    return Row(
      children: [
        avatar,
        const Gap.s(horizontal: true),
        Expanded(
          child: Text(
            member.name,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          width: KpSpacing.xs,
          height: KpSpacing.xs,
          decoration: BoxDecoration(
            color: member.online
                ? context.colors.success
                : context.colorScheme.outlineVariant,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class _SharedMediaSection extends StatelessWidget {
  const _SharedMediaSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.xl,
        0,
        KpSpacing.xl,
        KpSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RailTitle(context.l10n.groupChatSharedMedia),
          const Gap.m(),
          Row(
            children: [
              for (final url in kGroupChatMedia) ...[
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: KpRadii.allS,
                      child: KpNetworkImage(url: url),
                    ),
                  ),
                ),
                const Gap.xs(horizontal: true),
              ],
              const Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DottedMediaTile(more: kGroupChatMediaMore),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A dashed "+N more" tile closing the shared-media grid.
class DottedMediaTile extends StatelessWidget {
  const DottedMediaTile({required this.more, super.key});

  final int more;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allS,
        border: Border.all(color: context.colorScheme.outlineVariant, width: 2),
      ),
      child: Center(
        child: Text(
          '+$more',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.outline,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class _MascotWidget extends StatelessWidget {
  const _MascotWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(KpSpacing.xl, 0, KpSpacing.xl, 0),
      child: Container(
        padding: const EdgeInsets.all(KpSpacing.l),
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: KpRadii.allXl,
          boxShadow: const [
            BoxShadow(color: KpColors.brand600, offset: Offset(0, 8)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: _MemberRow._size,
              height: _MemberRow._size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.face_rounded,
                color: context.colorScheme.primary,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.groupChatMascotTitle,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.groupChatMascotBody,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onPrimary.withValues(
                        alpha: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
