import 'package:core/core.dart';

import 'package:keenpockets/features/money/domain/entities/payout.dart';

/// Reads the payouts/bank hub. (Withdraw + bank-account CRUD mutations land in a
/// later money increment — see docs/API_SPEC.md §4.)
abstract interface class PayoutsRepository {
  Future<Result<PayoutsHub>> getPayoutsHub();
}
