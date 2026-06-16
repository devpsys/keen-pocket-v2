import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/error/exceptions.dart';
import 'package:keenpockets/core/error/failures.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/core/result/result.dart';
import 'package:keenpockets/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:keenpockets/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:keenpockets/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:keenpockets/features/auth/data/models/login_request_model.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';
import 'package:keenpockets/features/auth/domain/repositories/auth_repository.dart';

/// Implements the domain [AuthRepository] over remote + local data sources.
///
/// All data-layer exceptions are caught here and converted to [Failure]s; no
/// exception escapes to the domain/presentation layers.
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remote, this._local, this._connectivity);

  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;
  final ConnectivityChecker _connectivity;

  @override
  Future<Result<AuthUser>> login({
    required String email,
    required String password,
  }) async {
    if (!await _connectivity.isConnected) {
      return const Result.failure(NetworkFailure());
    }
    try {
      final response = await _remote.login(
        LoginRequestModel(email: email, password: password),
      );
      await _local.cacheSession(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        user: response.user,
      );
      return Result.success(response.user.toEntity());
    } on AppException catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _local.clear();
      return const Result.success(null);
    } on AppException catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  @override
  Future<Result<AuthUser?>> currentUser() async {
    try {
      final cached = await _local.getCachedUser();
      return Result.success(cached?.toEntity());
    } on AppException catch (e) {
      return Result.failure(_mapException(e));
    }
  }

  /// Single place that translates the exception hierarchy into failures.
  Failure _mapException(AppException e) => switch (e) {
    NetworkException() => NetworkFailure(message: e.message, cause: e),
    UnauthorizedException() => UnauthorizedFailure(
      message: e.message,
      cause: e,
    ),
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
