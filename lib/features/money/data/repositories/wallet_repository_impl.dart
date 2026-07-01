import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/money/data/datasources/wallet_remote_datasource.dart';
import 'package:keenpockets/features/money/data/mappers/wallet_mapper.dart';
import 'package:keenpockets/features/money/domain/entities/wallet.dart';
import 'package:keenpockets/features/money/domain/repositories/wallet_repository.dart';

@LazySingleton(as: WalletRepository, env: ['prod', 'staging'])
class WalletRepositoryImpl implements WalletRepository {
  const WalletRepositoryImpl(this._remote, this._connectivity);

  final WalletRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<Wallet>> getWallet() async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dto = await _remote.getWallet();
      return Right(dto.toEntity());
    } on AppException catch (e) {
      return Left(_mapException(e));
    }
  }

  Failure _mapException(AppException e) => switch (e) {
    NetworkException() => NetworkFailure(message: e.message, cause: e),
    UnauthorizedException() => AuthFailure(message: e.message, cause: e),
    ValidationException() => ValidationFailure(
      message: e.message,
      fieldErrors: e.fieldErrors,
      cause: e,
    ),
    CacheException() => CacheFailure(message: e.message, cause: e),
    ServerException() => ServerFailure(
      message: e.message,
      statusCode: e.statusCode,
      cause: e,
    ),
  };
}
