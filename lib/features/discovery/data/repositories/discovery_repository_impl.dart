import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/discovery/data/datasources/discovery_remote_datasource.dart';
import 'package:keenpockets/features/discovery/data/mappers/discover_item_mapper.dart';
import 'package:keenpockets/features/discovery/domain/entities/discover_item.dart';
import 'package:keenpockets/features/discovery/domain/repositories/discovery_repository.dart';

@LazySingleton(as: DiscoveryRepository, env: ['prod', 'staging'])
class DiscoveryRepositoryImpl implements DiscoveryRepository {
  const DiscoveryRepositoryImpl(this._remote, this._connectivity);

  final DiscoveryRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<List<DiscoverItem>>> discover(String query) async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dtos = await _remote.discover(query);
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
