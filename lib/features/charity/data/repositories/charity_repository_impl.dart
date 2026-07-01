import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/charity/data/datasources/charity_remote_datasource.dart';
import 'package:keenpockets/features/charity/data/mappers/charity_drive_mapper.dart';
import 'package:keenpockets/features/charity/domain/entities/charity_drive.dart';
import 'package:keenpockets/features/charity/domain/repositories/charity_repository.dart';

@LazySingleton(as: CharityRepository, env: ['prod', 'staging'])
class CharityRepositoryImpl implements CharityRepository {
  const CharityRepositoryImpl(this._remote, this._connectivity);

  final CharityRemoteDataSource _remote;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<CharityDrive>> getDrive(String pocketId) async {
    if (!await _connectivity.isConnected) {
      return const Left(NetworkFailure());
    }
    try {
      final dto = await _remote.getDrive(pocketId);
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
