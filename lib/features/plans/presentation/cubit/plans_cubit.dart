import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/plans/domain/entities/plan.dart';
import 'package:keenpockets/features/plans/domain/usecases/get_plans.dart';
import 'package:keenpockets/features/plans/presentation/cubit/plans_state.dart';
import 'package:keenpockets/features/plans/presentation/view_models/plan_view.dart'
    as vm;

/// Loads the user's plans via [GetPlans] and projects entities into
/// [PlanView]s.
@injectable
class PlansCubit extends Cubit<PlansState> {
  PlansCubit(this._getPlans) : super(const PlansState());

  final GetPlans _getPlans;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getPlans(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (plans) {
          final views = plans.map((p) => p.toView()).toList();
          return state.copyWith(
            status: views.isEmpty ? StateStatus.empty : StateStatus.success,
            plans: views,
            failure: null,
          );
        },
      ),
    );
  }
}

extension on Plan {
  vm.PlanView toView() => vm.PlanView(
    id: id,
    name: name,
    periodLabel: periodLabel,
    cadence: switch (cadence) {
      PlanCadence.weekly => vm.PlanCadence.weekly,
      PlanCadence.monthly => vm.PlanCadence.monthly,
    },
    bought: bought,
    pending: pending,
    deferred: deferred,
    spent: spent,
    budget: budget,
  );
}
