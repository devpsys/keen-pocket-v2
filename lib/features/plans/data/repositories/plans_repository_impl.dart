import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/plans/data/datasources/plans_remote_datasource.dart';
import 'package:keenpockets/features/plans/data/mappers/plan_mapper.dart';
import 'package:keenpockets/features/plans/domain/entities/plan.dart';
import 'package:keenpockets/features/plans/domain/repositories/plans_repository.dart';

@LazySingleton(as: PlansRepository, env: ['prod', 'staging'])
class PlansRepositoryImpl implements PlansRepository {
  const PlansRepositoryImpl(this._remote, this._connectivity);

  final PlansRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<List<Plan>>> getPlans() async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dtos = await _remote.getPlans();
      return Right(dtos.map((d) => d.toEntity()).toList());
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
