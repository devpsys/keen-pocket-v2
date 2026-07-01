import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/trust/domain/entities/trust_profile.dart';
import 'package:keenpockets/features/trust/domain/repositories/trust_repository.dart';

/// Fetches the signed-in user's reputation profile (`GET /me/trust`).
@injectable
class GetTrustProfile implements UseCase<TrustProfile, NoParams> {
  const GetTrustProfile(this._repository);

  final TrustRepository _repository;

  @override
  Future<Result<TrustProfile>> call(NoParams params) =>
      _repository.getMyTrust();
}
