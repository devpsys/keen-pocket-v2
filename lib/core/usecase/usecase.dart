import 'package:keenpockets/core/result/result.dart';

/// Base contract for every use case in the domain layer.
///
/// A use case represents a single, named business operation. It takes a
/// [Params] object and returns a `Result<T>`. Keeping the signature uniform
/// lets us compose, decorate, and test use cases consistently.
///
/// ```dart
/// @injectable
/// class LoginUseCase implements UseCase<AuthUser, LoginParams> {
///   const LoginUseCase(this._repository);
///   final AuthRepository _repository;
///
///   @override
///   Future<Result<AuthUser>> call(LoginParams params) =>
///       _repository.login(email: params.email, password: params.password);
/// }
/// ```
abstract interface class UseCase<T, Params> {
  Future<Result<T>> call(Params params);
}

/// Synchronous variant for pure, non-async business rules.
abstract interface class SyncUseCase<T, Params> {
  Result<T> call(Params params);
}

/// Marker for use cases that take no parameters.
///
/// ```dart
/// class LogoutUseCase implements UseCase<void, NoParams> { ... }
/// await logoutUseCase(const NoParams());
/// ```
final class NoParams {
  const NoParams();
}
