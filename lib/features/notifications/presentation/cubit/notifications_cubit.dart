import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/notifications/domain/entities/app_notification.dart';
import 'package:keenpockets/features/notifications/domain/usecases/get_notifications.dart';
import 'package:keenpockets/features/notifications/domain/usecases/mark_all_read.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/view_models/notification_view.dart'
    as vm;

/// Loads the inbox via [GetNotifications] and projects entities into
/// [NotificationView]s; [markAllRead] is optimistic + [MarkAllRead].
@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._getNotifications, this._markAllRead)
    : super(const NotificationsState());

  final GetNotifications _getNotifications;
  final MarkAllRead _markAllRead;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getNotifications(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (items) {
          final views = items.map((n) => n.toView()).toList();
          return state.copyWith(
            status: views.isEmpty ? StateStatus.empty : StateStatus.success,
            items: views,
            selectedId: views.isNotEmpty ? views.first.id : null,
            failure: null,
          );
        },
      ),
    );
  }

  Future<void> markAllRead() async {
    emit(state.copyWith(items: [for (final n in state.items) n.markRead()]));
    await _markAllRead(const NoParams()); // best-effort; server reconciles
  }

  void setFilter(NotificationFilter filter) =>
      emit(state.copyWith(filter: filter));

  /// Tablet master-detail: select the notification shown in the detail pane.
  void select(String id) => emit(state.copyWith(selectedId: id));
}

extension on AppNotification {
  vm.NotificationView toView() => vm.NotificationView(
    id: id,
    title: title,
    body: body,
    isRead: isRead,
    timeAgo: timeAgo,
    kind: switch (kind) {
      NotificationKind.payment => vm.NotificationKind.payment,
      NotificationKind.member => vm.NotificationKind.member,
      NotificationKind.invite => vm.NotificationKind.invite,
      NotificationKind.reminder => vm.NotificationKind.reminder,
      NotificationKind.security => vm.NotificationKind.security,
      NotificationKind.adashi => vm.NotificationKind.adashi,
      NotificationKind.support => vm.NotificationKind.support,
    },
    dateLabel: dateLabel,
    category: category,
    detailBody: detailBody,
    goalPercent: goalPercent,
    savedLabel: savedLabel,
    targetLabel: targetLabel,
    relatedPocket: relatedPocket,
    relatedPocketImageUrl: relatedPocketImageUrl,
    sourceAccount: sourceAccount,
    mascotTip: mascotTip,
  );
}
