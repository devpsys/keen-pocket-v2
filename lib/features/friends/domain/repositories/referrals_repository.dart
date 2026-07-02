import 'package:core/core.dart';

import 'package:keenpockets/features/friends/domain/entities/referral.dart';

/// Reads the user's refer-&-earn summary (see docs/API_SPEC.md §13).
abstract interface class ReferralsRepository {
  Future<Result<Referral>> getReferrals();
}
