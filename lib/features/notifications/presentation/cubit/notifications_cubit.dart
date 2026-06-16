import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/view_models/notification_view.dart';

/// PRESENTATION-ONLY: placeholder inbox; swap for a use case later.
@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    const items = [
      NotificationView(
        id: 'n1',
        title: 'Contribution verified',
        body: 'Your contribution to Family Circle was verified.',
        isRead: false,
      ),
      NotificationView(
        id: 'n2',
        title: 'New cycle started',
        body: 'Cycle 3 of Market Women Ajo has begun.',
        isRead: true,
      ),
    ];
    emit(
      state.copyWith(
        status: items.isEmpty ? StateStatus.empty : StateStatus.success,
        items: items,
      ),
    );
  }

  void markAllRead() =>
      emit(state.copyWith(items: [for (final n in state.items) n.markRead()]));
}
