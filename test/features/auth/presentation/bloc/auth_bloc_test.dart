import 'package:bloc_test/bloc_test.dart';
import 'package:core/error/failures.dart';
import 'package:core/presentation/state_status.dart';
import 'package:core/result/result.dart';
import 'package:core/usecase/usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';
import 'package:keenpockets/features/auth/domain/usecases/login_usecase.dart';
import 'package:keenpockets/features/auth/domain/usecases/logout_usecase.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginUseCase extends Mock implements LoginUseCase {}

class _MockLogoutUseCase extends Mock implements LogoutUseCase {}

class _MockSessionManager extends Mock implements SessionManager {}

void main() {
  late _MockLoginUseCase login;
  late _MockLogoutUseCase logout;
  late _MockSessionManager session;

  const user = AuthUser(id: '1', email: 'ada@keenpockets.dev', name: 'Ada');

  setUpAll(() {
    registerFallbackValue(const LoginParams(email: '', password: ''));
    registerFallbackValue(const NoParams());
  });

  setUp(() {
    login = _MockLoginUseCase();
    logout = _MockLogoutUseCase();
    session = _MockSessionManager();
  });

  AuthBloc build() => AuthBloc(login, logout, session);

  group('AuthBloc loginRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits [loading, success] when login succeeds',
      setUp: () =>
          when(() => login(any())).thenAnswer((_) async => const Right(user)),
      build: build,
      act: (bloc) => bloc.add(
        const AuthEvent.loginRequested(
          email: 'ada@keenpockets.dev',
          password: 'password123',
        ),
      ),
      expect: () => [
        isA<AuthState>().having((s) => s.status, 'status', StateStatus.loading),
        isA<AuthState>()
            .having((s) => s.status, 'status', StateStatus.success)
            .having((s) => s.user, 'user', user),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loading, failure] with field errors on ValidationFailure',
      setUp: () => when(() => login(any())).thenAnswer(
        (_) async =>
            const Left(ValidationFailure(fieldErrors: {'email': 'invalid'})),
      ),
      build: build,
      act: (bloc) => bloc.add(
        const AuthEvent.loginRequested(email: 'x', password: 'password123'),
      ),
      expect: () => [
        isA<AuthState>().having((s) => s.status, 'status', StateStatus.loading),
        isA<AuthState>()
            .having((s) => s.status, 'status', StateStatus.failure)
            .having((s) => s.fieldErrors['email'], 'email error', 'invalid'),
      ],
    );
  });

  group('AuthBloc logoutRequested', () {
    blocTest<AuthBloc, AuthState>(
      'resets to initial state',
      setUp: () =>
          when(() => logout(any())).thenAnswer((_) async => const Right(null)),
      build: build,
      seed: () => const AuthState(status: StateStatus.success, user: user),
      act: (bloc) => bloc.add(const AuthEvent.logoutRequested()),
      expect: () => [
        isA<AuthState>()
            .having((s) => s.status, 'status', StateStatus.initial)
            .having((s) => s.user, 'user', isNull),
      ],
    );
  });
}
