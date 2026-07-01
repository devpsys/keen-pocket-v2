import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/domain/entities/wallet.dart';
import 'package:keenpockets/features/money/domain/repositories/wallet_repository.dart';

/// Fetches the user's wallet (`GET /wallet`).
@injectable
class GetWallet implements UseCase<Wallet, NoParams> {
  const GetWallet(this._repository);

  final WalletRepository _repository;

  @override
  Future<Result<Wallet>> call(NoParams params) => _repository.getWallet();
}
