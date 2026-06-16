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
        name: 'Monthly Groceries',
        itemCount: 14,
        budget: Money(8000000),
      ),
      PlanView(
        id: 'pl2',
        name: 'Back to School',
        itemCount: 6,
        budget: Money(4500000),
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
