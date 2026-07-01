import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/plans/domain/entities/plan.dart';
import 'package:keenpockets/features/plans/domain/repositories/plans_repository.dart';

/// Dev-only stub so the plans list renders without a backend. Mirrors the old
/// presentation placeholder. `prod`/`staging` use [PlansRepositoryImpl].
@LazySingleton(as: PlansRepository, env: ['dev'])
class FakePlansRepository implements PlansRepository {
  const FakePlansRepository();

  @override
  Future<Result<List<Plan>>> getPlans() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const Right([
      Plan(
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
      Plan(
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
      Plan(
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
    ]);
  }
}
