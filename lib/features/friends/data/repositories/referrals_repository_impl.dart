import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/friends/data/datasources/referrals_remote_datasource.dart';
import 'package:keenpockets/features/friends/data/mappers/referral_mapper.dart';
import 'package:keenpockets/features/friends/domain/entities/referral.dart';
import 'package:keenpockets/features/friends/domain/repositories/referrals_repository.dart';

@LazySingleton(as: ReferralsRepository, env: ['prod', 'staging'])
class ReferralsRepositoryImpl implements ReferralsRepository {
  const ReferralsRepositoryImpl(this._remote, this._connectivity);

  final ReferralsRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<Referral>> getReferrals() async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dto = await _remote.getReferrals();
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
