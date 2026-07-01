import 'package:core/core.dart';

import 'package:keenpockets/features/money/domain/entities/wallet.dart';

/// Reads the user's wallet. (Top-up + payouts mutations land in later money
/// increments — see docs/API_SPEC.md §4.)
abstract interface class WalletRepository {
  Future<Result<Wallet>> getWallet();
}
