import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:keenpockets/features/auth/data/dtos/auth_user_dto.dart';
import 'package:keenpockets/features/auth/data/dtos/login_request_dto.dart';
import 'package:keenpockets/features/auth/data/dtos/login_response_dto.dart';

/// Dev-only stub so the UI can be exercised without a backend. Registered for
/// the `dev` environment only; `prod`/`staging` use [AuthRemoteDataSourceImpl].
///
/// Credentials are already format-validated by `LoginUseCase` before reaching
/// here, so any valid-looking email + 8+ char password "logs in".
@LazySingleton(as: AuthRemoteDataSource, env: ['dev'])
class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  const FakeAuthRemoteDataSource();

  @override
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    final local = request.email.split('@').first;
    final name = local.isEmpty
        ? 'KeenPocket User'
        : '${local[0].toUpperCase()}${local.substring(1)}';
    return LoginResponseDto(
      accessToken: 'dev-access-token',
      refreshToken: 'dev-refresh-token',
      user: AuthUserDto(id: 'dev-user-1', email: request.email, name: name),
    );
  }
}
