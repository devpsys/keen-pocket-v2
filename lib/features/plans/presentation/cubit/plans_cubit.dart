import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/plans/presentation/cubit/plans_state.dart';
import 'package:keenpockets/features/plans/presentation/view_models/plan_view.dart';

/// PRESENTATION-ONLY: placeholder plans; backend-gap, so the page is also
/// flag-gated (built dark). Swap for a use case when the API exists.
@injectable
class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(const PlansState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    const plans = [
      PlanView(
        id: 'pl1',
        name: 'Family Groceries',
        periodLabel: 'June 2026',
        cadence: PlanCadence.monthly,
        bought: 8,
        pending: 5,
        deferred: 2,
        spent: Money(520000),
        budget: Money(800000),
      ),
      PlanView(
        id: 'pl2',
        name: 'Bachelor Week',
        periodLabel: 'June 2026',
        cadence: PlanCadence.weekly,
        bought: 12,
        pending: 0,
        deferred: 1,
        spent: Money(414000),
        budget: Money(450000),
      ),
      PlanView(
        id: 'pl3',
        name: 'Office Pantry',
        periodLabel: 'June 2026',
        cadence: PlanCadence.monthly,
        bought: 2,
        pending: 18,
        deferred: 0,
        spent: Money(120000),
        budget: Money(800000),
      ),
    ];
    emit(
      state.copyWith(
        status: plans.isEmpty ? StateStatus.empty : StateStatus.success,
        plans: plans,
      ),
    );
  }
}
