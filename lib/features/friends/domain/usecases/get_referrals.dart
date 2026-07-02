import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/friends/domain/entities/referral.dart';
import 'package:keenpockets/features/friends/domain/repositories/referrals_repository.dart';

/// Fetches the refer-&-earn summary (`GET /referrals`).
@injectable
class GetReferrals implements UseCase<Referral, NoParams> {
  const GetReferrals(this._repository);

  final ReferralsRepository _repository;

  @override
  Future<Result<Referral>> call(NoParams params) => _repository.getReferrals();
}
