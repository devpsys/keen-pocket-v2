import 'package:core/core.dart';

import 'package:keenpockets/features/trust/domain/entities/trust_profile.dart';

/// Reads reputation profiles. (Vouches + KYC mutations land in later
/// increments of the trust batch — see docs/API_SPEC.md §3.)
abstract interface class TrustRepository {
  /// The signed-in user's reputation profile (`GET /me/trust`).
  Future<Result<TrustProfile>> getMyTrust();
}
