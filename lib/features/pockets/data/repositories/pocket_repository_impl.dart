import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/pockets/data/datasources/pocket_remote_datasource.dart';
import 'package:keenpockets/features/pockets/data/mappers/pocket_mapper.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/domain/repositories/pocket_repository.dart';

/// Implements [PocketRepository] over the remote data source. Converts every
/// [AppException] to a [Failure]; nothing throws across the boundary.
@LazySingleton(as: PocketRepository)
class PocketRepositoryImpl implements PocketRepository {
  const PocketRepositoryImpl(this._remote, this._connectivity);

  final PocketRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<List<Pocket>>> getMyPockets() async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dtos = await _remote.getMyPockets();
      return Right(dtos.map((d) => d.toEntity()).toList());
    } on AppException catch (e) {
      return Left(_mapException(e));
    }
  }

  @override
  Future<Result<Pocket>> getPocket(String id) async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dto = await _remote.getPocket(id);
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
