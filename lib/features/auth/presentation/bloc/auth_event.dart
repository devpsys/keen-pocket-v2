import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

/// Events accepted by [AuthBloc].
@freezed
sealed class AuthEvent with _$AuthEvent {
  /// User submitted the login form.
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = LoginRequested;

  /// User tapped log out.
  const factory AuthEvent.logoutRequested() = LogoutRequested;

  /// App startup — restore any cached session.
  const factory AuthEvent.sessionChecked() = SessionChecked;
}
