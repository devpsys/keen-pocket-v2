import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/trust/data/datasources/trust_remote_datasource.dart';
import 'package:keenpockets/features/trust/data/mappers/trust_profile_mapper.dart';
import 'package:keenpockets/features/trust/domain/entities/trust_profile.dart';
import 'package:keenpockets/features/trust/domain/repositories/trust_repository.dart';

@LazySingleton(as: TrustRepository, env: ['prod', 'staging'])
class TrustRepositoryImpl implements TrustRepository {
  const TrustRepositoryImpl(this._remote, this._connectivity);

  final TrustRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<TrustProfile>> getMyTrust() async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dto = await _remote.getMyTrust();
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
