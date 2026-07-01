import 'package:core/core.dart';

import 'package:keenpockets/features/plans/domain/entities/plan.dart';

/// Reads the user's shopping/budget plans (see docs/API_SPEC.md §10).
abstract interface class PlansRepository {
  Future<Result<List<Plan>>> getPlans();
}
