import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/domain/entities/payout.dart';
import 'package:keenpockets/features/money/domain/repositories/payouts_repository.dart';

/// Fetches the payouts/bank hub (`GET /payouts`).
@injectable
class GetPayouts implements UseCase<PayoutsHub, NoParams> {
  const GetPayouts(this._repository);

  final PayoutsRepository _repository;

  @override
  Future<Result<PayoutsHub>> call(NoParams params) =>
      _repository.getPayoutsHub();
}
