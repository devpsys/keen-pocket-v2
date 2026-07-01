import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/plans/domain/entities/plan.dart';
import 'package:keenpockets/features/plans/domain/repositories/plans_repository.dart';

/// Fetches the user's plans (`GET /plans`).
@injectable
class GetPlans implements UseCase<List<Plan>, NoParams> {
  const GetPlans(this._repository);

  final PlansRepository _repository;

  @override
  Future<Result<List<Plan>>> call(NoParams params) => _repository.getPlans();
}
