import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';

/// Aggregation cockpit. Greeting comes from the session; the figures are
/// PRESENTATION-ONLY placeholders until a `GetDashboard` use case lands.
@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._session) : super(const DashboardState());

  final SessionManager _session;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        data: DashboardView(
          greetingName: _session.currentUser?.name ?? 'there',
          totalSaved: const Money(7450000),
          activePockets: 3,
          streakDays: 12,
          weeklyGoalProgress: 0.65,
        ),
      ),
    );
  }
}
