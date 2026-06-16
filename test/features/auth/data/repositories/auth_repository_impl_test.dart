import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/error/exceptions.dart';
import 'package:keenpockets/core/error/failures.dart';
import 'package:keenpockets/core/network/connectivity_checker.dart';
import 'package:keenpockets/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:keenpockets/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:keenpockets/features/auth/data/dtos/auth_user_dto.dart';
import 'package:keenpockets/features/auth/data/dtos/login_request_dto.dart';
import 'package:keenpockets/features/auth/data/dtos/login_response_dto.dart';
import 'package:keenpockets/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource {}

class _MockLocal extends Mock implements AuthLocalDataSource {}

class _MockConnectivity extends Mock implements ConnectivityChecker {}

void main() {
  late _MockRemote remote;
  late _MockLocal local;
  late _MockConnectivity connectivity;
  late AuthRepositoryImpl repository;

  const userModel = AuthUserDto(
    id: '1',
    email: 'ada@keenpockets.dev',
    name: 'Ada',
  );
  const response = LoginResponseDto(
    accessToken: 'token',
    refreshToken: 'refresh',
    user: userModel,
  );

  setUpAll(() {
    registerFallbackValue(const LoginRequestDto(email: '', password: ''));
    registerFallbackValue(userModel);
  });

  setUp(() {
    remote = _MockRemote();
    local = _MockLocal();
    connectivity = _MockConnectivity();
    repository = AuthRepositoryImpl(remote, local, connectivity);
  });

  group('login', () {
    test('returns NetworkFailure when offline (remote not called)', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => false);

      final result = await repository.login(
        email: 'ada@keenpockets.dev',
        password: 'password123',
      );

      expect(result.getLeft().toNullable(), isA<NetworkFailure>());
      verifyNever(() => remote.login(any()));
    });

    test('returns user and caches session on success', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(() => remote.login(any())).thenAnswer((_) async => response);
      when(
        () => local.cacheSession(
          accessToken: any(named: 'accessToken'),
          refreshToken: any(named: 'refreshToken'),
          user: any(named: 'user'),
        ),
      ).thenAnswer((_) async {});

      final result = await repository.login(
        email: 'ada@keenpockets.dev',
        password: 'password123',
      );

      expect(result.toNullable()?.email, 'ada@keenpockets.dev');
      verify(
        () => local.cacheSession(
          accessToken: 'token',
          refreshToken: 'refresh',
          user: userModel,
        ),
      ).called(1);
    });

    test('maps UnauthorizedException to AuthFailure', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(
        () => remote.login(any()),
      ).thenThrow(const UnauthorizedException('nope'));

      final result = await repository.login(
        email: 'ada@keenpockets.dev',
        password: 'password123',
      );

      expect(result.getLeft().toNullable(), isA<AuthFailure>());
    });

    test('maps ServerException to ServerFailure with status code', () async {
      when(() => connectivity.isConnected).thenAnswer((_) async => true);
      when(
        () => remote.login(any()),
      ).thenThrow(const ServerException('boom', statusCode: 500));

      final result = await repository.login(
        email: 'ada@keenpockets.dev',
        password: 'password123',
      );

      final failure = result.getLeft().toNullable();
      expect(failure, isA<ServerFailure>());
      expect((failure! as ServerFailure).statusCode, 500);
    });
  });

  group('currentUser', () {
    test('returns cached user mapped to entity', () async {
      when(() => local.getCachedUser()).thenAnswer((_) async => userModel);

      final result = await repository.currentUser();

      expect(result.toNullable()?.id, '1');
    });

    test('maps CacheException to CacheFailure', () async {
      when(
        () => local.getCachedUser(),
      ).thenThrow(const CacheException('disk error'));

      final result = await repository.currentUser();

      expect(result.getLeft().toNullable(), isA<CacheFailure>());
    });
  });
}
