import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/view_models/notification_view.dart';
import 'package:keenpockets/features/notifications/presentation/widgets/notifications_widgets.dart';

/// Tablet inbox (design `notifications_inbox_tablet`): a master list on the left
/// and the selected notification's detail on the right. The nav rail is
/// provided by `AppTabletShell`. Presentation-only.
class NotificationsInboxTabletView extends StatelessWidget {
  const NotificationsInboxTabletView({
    required this.state,
    this.onFilter,
    this.onSelect,
    super.key,
  });

  final NotificationsState state;
  final ValueChanged<NotificationFilter>? onFilter;
  final ValueChanged<String>? onSelect;

  @override
  Widget build(BuildContext context) {
    final items = state.visible;
    final selected =
        items.where((n) => n.id == state.selectedId).firstOrNull ??
        (items.isNotEmpty ? items.first : null);
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _MasterList(
            items: items,
            filter: state.filter,
            selectedId: selected?.id,
            onFilter: onFilter,
            onSelect: onSelect,
          ),
        ),
        Expanded(
          flex: 4,
          child: selected == null
              ? const NotificationsEmptyState()
              : _DetailPane(notification: selected),
        ),
      ],
    );
  }
}

// ── Master list ─────────────────────────────────────────────────────────────
class _MasterList extends StatelessWidget {
  const _MasterList({
    required this.items,
    required this.filter,
    required this.selectedId,
    this.onFilter,
    this.onSelect,
  });

  final List<NotificationView> items;
  final NotificationFilter filter;
  final String? selectedId;
  final ValueChanged<NotificationFilter>? onFilter;
  final ValueChanged<String>? onSelect;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          right: BorderSide(color: context.colorScheme.surfaceContainerHighest),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(KpSpacing.l),
            child: _SegmentedFilter(filter: filter, onFilter: onFilter),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                KpSpacing.m,
                0,
                KpSpacing.m,
                KpSpacing.l,
              ),
              itemCount: items.length,
              separatorBuilder: (_, _) => const Gap.m(),
              itemBuilder: (_, i) {
                final n = items[i];
                return _CaseTile(
                  notification: n,
                  selected: n.id == selectedId,
                  onTap: () => onSelect?.call(n.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentedFilter extends StatelessWidget {
  const _SegmentedFilter({required this.filter, this.onFilter});

  final NotificationFilter filter;
  final ValueChanged<NotificationFilter>? onFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.xxs),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          _Segment(
            label: context.l10n.notificationsFilterAll,
            selected: filter == NotificationFilter.all,
            onTap: () => onFilter?.call(NotificationFilter.all),
          ),
          _Segment(
            label: context.l10n.notificationsFilterUnreadShort,
            selected: filter == NotificationFilter.unread,
            onTap: () => onFilter?.call(NotificationFilter.unread),
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({required this.label, required this.selected, this.onTap});

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: selected ? context.colorScheme.surface : KpColors.transparent,
        borderRadius: KpRadii.allM,
        child: InkWell(
          borderRadius: KpRadii.allM,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: selected
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CaseTile extends StatelessWidget {
  const _CaseTile({
    required this.notification,
    required this.selected,
    this.onTap,
  });

  final NotificationView notification;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: KpRadii.allL,
        boxShadow: [
          BoxShadow(
            color: selected
                ? context.colorScheme.primary
                : context.colorScheme.surfaceContainerHighest,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Material(
        color: context.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: KpRadii.allL,
          side: BorderSide(
            color: selected
                ? context.colorScheme.primary
                : context.colorScheme.surfaceContainerHighest,
            width: 2,
          ),
        ),
        child: InkWell(
          borderRadius: KpRadii.allL,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(KpSpacing.m),
            child: Row(
              children: [
                Container(
                  width: KpSpacing.xxl,
                  height: KpSpacing.xxl,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: notificationTint(context, notification.kind),
                    borderRadius: KpRadii.allM,
                  ),
                  child: Icon(
                    notificationIcon(notification.kind),
                    color: context.colorScheme.onSurface,
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
                                color: selected
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          const Gap.xs(horizontal: true),
                          Text(
                            notification.timeAgo,
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const Gap.xxs(),
                      Text(
                        notification.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }
}

// ── Detail pane ─────────────────────────────────────────────────────────────
class _DetailPane extends StatelessWidget {
  const _DetailPane({required this.notification});

  final NotificationView notification;

  @override
  Widget build(BuildContext context) {
    final n = notification;
    return ColoredBox(
      color: context.colorScheme.surface,
      child: ListView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        children: [
          _DetailHeader(notification: n),
          const Gap.l(),
          _MessageCard(notification: n),
          if (n.relatedPocket != null || n.sourceAccount != null) ...[
            const Gap.l(),
            _RelatedRow(notification: n),
          ],
          const Gap.l(),
          const _ActionBar(),
          if (n.mascotTip != null) ...[
            const Gap.xl(),
            _MascotTip(tip: n.mascotTip!),
          ],
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.notification});

  final NotificationView notification;

  @override
  Widget build(BuildContext context) {
    final n = notification;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: KpSpacing.xxl,
          height: KpSpacing.xxl,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: notificationTint(context, n.kind),
            borderRadius: KpRadii.allL,
          ),
          child: Icon(
            notificationIcon(n.kind),
            color: context.colorScheme.onSurface,
            size: KpSpacing.xl,
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                n.title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap.xxs(),
              Wrap(
                spacing: KpSpacing.s,
                runSpacing: KpSpacing.xs,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  if (n.dateLabel != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          size: KpSpacing.m,
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        const Gap.xxs(horizontal: true),
                        Text(
                          n.dateLabel!,
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  if (n.category != null) _CategoryChip(label: n.category!),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(KpRadii.pill)),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// Candy card decoration shared across the detail pane.
BoxDecoration _detailCard(BuildContext context) => BoxDecoration(
  color: context.colorScheme.surface,
  borderRadius: KpRadii.allXl,
  boxShadow: [
    BoxShadow(
      color: context.colorScheme.surfaceContainerHighest,
      offset: const Offset(0, 7),
    ),
  ],
);

class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.notification});

  final NotificationView notification;

  @override
  Widget build(BuildContext context) {
    final n = notification;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: _detailCard(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            n.detailBody ?? n.body,
            style: context.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (n.goalPercent != null) ...[
            const Gap.l(),
            _ProgressBlock(notification: n),
          ],
        ],
      ),
    );
  }
}

class _ProgressBlock extends StatelessWidget {
  const _ProgressBlock({required this.notification});

  final NotificationView notification;

  @override
  Widget build(BuildContext context) {
    final n = notification;
    final pct = ((n.goalPercent ?? 0) * 100).round();
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: KpRadii.allL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.notificationsGoalProgress,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$pct%',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Gap.s(),
          KpProgressBar(
            value: n.goalPercent ?? 0,
            height: 10,
            color: context.colorScheme.primary,
          ),
          const Gap.s(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (n.savedLabel != null)
                Text(
                  n.savedLabel!,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              if (n.targetLabel != null)
                Text(
                  n.targetLabel!,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RelatedRow extends StatelessWidget {
  const _RelatedRow({required this.notification});

  final NotificationView notification;

  @override
  Widget build(BuildContext context) {
    final n = notification;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (n.relatedPocket != null)
            Expanded(
              child: _RelatedCard(
                label: context.l10n.notificationsRelatedPocket,
                title: n.relatedPocket!,
                footer: context.l10n.notificationsViewDetails,
                footerColor: context.colorScheme.primary,
                leading: ClipRRect(
                  borderRadius: KpRadii.allM,
                  child: KpNetworkImage(
                    url: n.relatedPocketImageUrl ?? '',
                    width: KpSpacing.xxl,
                    height: KpSpacing.xxl,
                  ),
                ),
              ),
            ),
          if (n.relatedPocket != null && n.sourceAccount != null)
            const Gap.m(horizontal: true),
          if (n.sourceAccount != null)
            Expanded(
              child: _RelatedCard(
                label: context.l10n.notificationsSourceAccount,
                title: n.sourceAccount!,
                footer: context.l10n.notificationsAutoDebit,
                footerColor: context.colorScheme.onSurfaceVariant,
                leading: Container(
                  width: KpSpacing.xxl,
                  height: KpSpacing.xxl,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondaryContainer,
                    borderRadius: KpRadii.allM,
                  ),
                  child: Icon(
                    Icons.account_balance_rounded,
                    color: context.colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RelatedCard extends StatelessWidget {
  const _RelatedCard({
    required this.label,
    required this.title,
    required this.footer,
    required this.footerColor,
    required this.leading,
  });

  final String label;
  final String title;
  final String footer;
  final Color footerColor;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: _detailCard(context),
      child: Row(
        children: [
          leading,
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  footer,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: footerColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: KpButton(
            label: context.l10n.notificationsViewReceipt,
            icon: Icons.receipt_long_rounded,
            onPressed: () {},
          ),
        ),
        const Gap.m(horizontal: true),
        Expanded(
          child: KpButton(
            label: context.l10n.notificationsMarkAsRead,
            icon: Icons.check_circle_rounded,
            variant: KpButtonVariant.neutral,
            onPressed: () {},
          ),
        ),
        const Gap.m(horizontal: true),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.errorContainer,
            borderRadius: KpRadii.allM,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline, color: context.colorScheme.error),
          ),
        ),
      ],
    );
  }
}

class _MascotTip extends StatelessWidget {
  const _MascotTip({required this.tip});

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
        border: Border.all(color: context.colorScheme.primary, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: KpSpacing.xxl,
            height: KpSpacing.xxl,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.face_rounded, color: context.colorScheme.primary),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.notificationsMrKTip,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap.xxs(),
                Text(
                  tip,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
