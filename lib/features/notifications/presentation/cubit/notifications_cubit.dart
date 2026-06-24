import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/notifications_fixtures.dart';

/// PRESENTATION-ONLY: sample-backed inbox (designs `notifications_inbox` /
/// `_tablet`). Swap for a real feed use case when the API exists.
@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: kNotifications.isEmpty
            ? StateStatus.empty
            : StateStatus.success,
        items: kNotifications,
        selectedId: kNotifications.isNotEmpty ? kNotifications.first.id : null,
      ),
    );
  }

  void markAllRead() =>
      emit(state.copyWith(items: [for (final n in state.items) n.markRead()]));

  void setFilter(NotificationFilter filter) =>
      emit(state.copyWith(filter: filter));

  /// Tablet master-detail: select the notification shown in the detail pane.
  void select(String id) => emit(state.copyWith(selectedId: id));
}
