import 'package:core/error/failures.dart';
import 'package:core/presentation/state_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';

part 'auth_state.freezed.dart';

/// Immutable state for the authentication flow. Exposes the mandated
/// initial / loading / success / failure surface via [StateStatus].
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(StateStatus.initial) StateStatus status,
    AuthUser? user,
    Failure? failure,
    @Default(<String, String>{}) Map<String, String> fieldErrors,
  }) = _AuthState;

  const AuthState._();

  bool get isAuthenticated => user != null && status.isSuccess;
}
