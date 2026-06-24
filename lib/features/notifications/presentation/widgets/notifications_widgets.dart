import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/view_models/notification_view.dart';

/// Accent tint for a notification's icon tile (shared phone + tablet).
Color notificationTint(BuildContext context, NotificationKind kind) =>
    switch (kind) {
      NotificationKind.payment => context.colorScheme.secondaryContainer,
      NotificationKind.member => context.colorScheme.primary,
      NotificationKind.invite => context.colorScheme.tertiaryContainer,
      NotificationKind.security => context.colorScheme.tertiaryContainer,
      NotificationKind.adashi => context.colorScheme.secondaryContainer,
      NotificationKind.reminder => context.colorScheme.surfaceContainerHigh,
      NotificationKind.support => context.colorScheme.surfaceContainerHigh,
    };

/// Material icon for the tablet list/detail tiles.
IconData notificationIcon(NotificationKind kind) => switch (kind) {
  NotificationKind.payment => Icons.payments_rounded,
  NotificationKind.member => Icons.person_rounded,
  NotificationKind.invite => Icons.mail_rounded,
  NotificationKind.security => Icons.warning_rounded,
  NotificationKind.adashi => Icons.groups_rounded,
  NotificationKind.reminder => Icons.alarm_rounded,
  NotificationKind.support => Icons.chat_rounded,
};

/// Phone inbox (design `notifications_inbox`): "Inbox" header + mark-all-read,
/// All/Unread filter tabs and the candy notification list. Presentation-only.
class NotificationsInboxView extends StatelessWidget {
  const NotificationsInboxView({
    required this.state,
    this.onMarkAllRead,
    this.onFilter,
    super.key,
  });

  final NotificationsState state;
  final VoidCallback? onMarkAllRead;
  final ValueChanged<NotificationFilter>? onFilter;

  @override
  Widget build(BuildContext context) {
    final items = state.visible;
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxl,
      ),
      children: [
        Text(
          context.l10n.notificationsInboxTitle,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const Gap.xxs(),
        Text(
          context.l10n.notificationsInboxSubtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.l(),
        KpButton(
          label: context.l10n.notificationsMarkAllRead,
          icon: Icons.done_all_rounded,
          onPressed: onMarkAllRead ?? () {},
        ),
        const Gap.l(),
        Row(
          children: [
            _FilterTab(
              label: context.l10n.notificationsFilterAll,
              selected: state.filter == NotificationFilter.all,
              onTap: () => onFilter?.call(NotificationFilter.all),
            ),
            const Gap.s(horizontal: true),
            _FilterTab(
              label: context.l10n.notificationsFilterUnread(state.unreadCount),
              selected: state.filter == NotificationFilter.unread,
              onTap: () => onFilter?.call(NotificationFilter.unread),
            ),
          ],
        ),
        const Gap.l(),
        if (items.isEmpty)
          const NotificationsEmptyState()
        else
          for (final n in items) ...[
            NotificationCard(notification: n),
            const Gap.m(),
          ],
      ],
    );
  }
}

class _FilterTab extends StatelessWidget {
  const _FilterTab({required this.label, required this.selected, this.onTap});

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected
        ? context.colorScheme.primary
        : context.colorScheme.surfaceContainerHigh;
    final base = selected
        ? KpColors.brand900
        : context.colorScheme.outlineVariant;
    final fg = selected
        ? context.colorScheme.onPrimary
        : context.colorScheme.onSurfaceVariant;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        boxShadow: [BoxShadow(color: base, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KpSpacing.l,
              vertical: KpSpacing.s,
            ),
            child: Text(
              label,
              style: context.textTheme.labelLarge?.copyWith(
                color: fg,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A single candy notification row (design `notifications_inbox`).
class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, this.onTap, super.key});

  final NotificationView notification;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final read = notification.isRead;
    final muted = context.colorScheme.onSurfaceVariant;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: KpRadii.allXl,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.surfaceContainerHighest,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Material(
        color: read
            ? context.colorScheme.surfaceContainer
            : context.colorScheme.surface,
        borderRadius: KpRadii.allXl,
        child: InkWell(
          borderRadius: KpRadii.allXl,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.m),
            child: Row(
              children: [
                SizedBox(
                  width: KpSpacing.s,
                  child: read
                      ? null
                      : Container(
                          width: KpSpacing.s,
                          height: KpSpacing.s,
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                ),
                const Gap.s(horizontal: true),
                Container(
                  width: KpSpacing.xxl,
                  height: KpSpacing.xxl,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: read
                        ? context.colorScheme.surfaceContainerHighest
                        : notificationTint(context, notification.kind),
                    borderRadius: KpRadii.allL,
                  ),
                  child: Text(
                    notification.emoji,
                    style: context.textTheme.titleLarge,
                  ),
                ),
                const Gap.m(horizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: read ? muted : null,
                              ),
                            ),
                          ),
                          const Gap.xs(horizontal: true),
                          Text(
                            notification.timeAgo,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.outline,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const Gap.xxs(),
                      Text(
                        notification.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// "All caught up" empty state (design `notifications_inbox`).
class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({this.onRefresh, super.key});

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.xxl),
      child: Column(
        children: [
          const KpMascot.celebrate(size: 140),
          const Gap.l(),
          Text(
            context.l10n.notificationsEmptyTitle,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Gap.xs(),
          Text(
            context.l10n.notificationsEmptyMessage,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.l(),
          KpButton(
            label: context.l10n.notificationsRefresh,
            variant: KpButtonVariant.secondary,
            onPressed: onRefresh ?? () {},
          ),
        ],
      ),
    );
  }
}
