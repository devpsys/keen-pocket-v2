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
          totalSaved: const Money(24800000),
          activePockets: 3,
          streakDays: 5,
          weeklyGoalProgress: 1,
          adashiGroups: 2,
          reputationTier: 'Tier 1',
          walletBalance: const Money(500000),
          freezesLeft: 2,
          weeklyGoalComplete: true,
          points: 85,
          badges: const ['Early Saver', 'Reliable Payer'],
          featuredPockets: const [
            DashboardPocketView(
              id: 'p1',
              name: 'December Turkey Fund',
              handPrice: Money(500000),
              tag: 'Savings',
              scheduleLabel: '6 months · 2026',
            ),
            DashboardPocketView(
              id: 'p2',
              name: 'Emergency Fund',
              handPrice: Money(1000000),
              tag: 'Savings',
              scheduleLabel: '12 months · 2026',
            ),
          ],
          featuredAdashi: const DashboardAdashiView(
            id: 'a1',
            name: 'Market Women Union',
            perCycle: Money(1000000),
            members: 8,
            cycleCurrent: 2,
            cycleTotal: 8,
          ),
        ),
      ),
    );
  }
}
