import 'package:keenpockets/core/result/result.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';

/// Domain contract for authentication. Implemented in the data layer; consumed
/// by use cases. Returns [Result] so callers handle failures explicitly.
abstract interface class AuthRepository {
  /// Exchanges credentials for an authenticated [AuthUser] (token persisted by
  /// the implementation).
  Future<Result<AuthUser>> login({
    required String email,
    required String password,
  });

  /// Clears the current session.
  Future<Result<void>> logout();

  /// Returns the currently signed-in user, or `null` when signed out.
  Future<Result<AuthUser?>> currentUser();
}
