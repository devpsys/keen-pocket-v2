import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/error/failures.dart';
import 'package:keenpockets/core/presentation/state_status.dart';
import 'package:keenpockets/core/usecase/usecase.dart';
import 'package:keenpockets/features/auth/domain/usecases/login_usecase.dart';
import 'package:keenpockets/features/auth/domain/usecases/logout_usecase.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_event.dart';
import 'package:keenpockets/features/auth/presentation/bloc/auth_state.dart';

/// Orchestrates authentication. The ONLY object presentation talks to for auth;
/// it depends on use cases, never on repositories or data sources directly.
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._loginUseCase, this._logoutUseCase) : super(const AuthState()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<SessionChecked>(_onSessionChecked);
  }

  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: StateStatus.loading,
        failure: null,
        fieldErrors: const <String, String>{},
      ),
    );

    final result = await _loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    emit(
      result.fold(
        onFailure: (failure) => state.copyWith(
          status: StateStatus.failure,
          failure: failure,
          fieldErrors: failure is ValidationFailure
              ? failure.fieldErrors
              : const <String, String>{},
        ),
        onSuccess: (user) => state.copyWith(
          status: StateStatus.success,
          user: user,
          failure: null,
          fieldErrors: const <String, String>{},
        ),
      ),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _logoutUseCase(const NoParams());
    emit(const AuthState());
  }

  Future<void> _onSessionChecked(
    SessionChecked event,
    Emitter<AuthState> emit,
  ) async {
    // Session restoration would call a `currentUser` use case here.
    emit(state.copyWith(status: StateStatus.initial));
  }
}
