import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/error/failures.dart';
import 'package:keenpockets/core/result/result.dart';
import 'package:keenpockets/core/usecase/usecase.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';
import 'package:keenpockets/features/auth/domain/repositories/auth_repository.dart';

/// Parameters for [LoginUseCase].
class LoginParams {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;
}

/// Validates credentials, then delegates to [AuthRepository].
///
/// Validation lives here (pure business rule) so it is enforced regardless of
/// which UI triggers the login. Field errors are returned as a
/// [ValidationFailure], never thrown.
@injectable
class LoginUseCase implements UseCase<AuthUser, LoginParams> {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  static final _emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
  static const _minPasswordLength = 8;

  @override
  Future<Result<AuthUser>> call(LoginParams params) async {
    final errors = <String, String>{};
    if (params.email.trim().isEmpty) {
      errors['email'] = 'required';
    } else if (!_emailRegex.hasMatch(params.email.trim())) {
      errors['email'] = 'invalid';
    }
    if (params.password.isEmpty) {
      errors['password'] = 'required';
    } else if (params.password.length < _minPasswordLength) {
      errors['password'] = 'too_short';
    }

    if (errors.isNotEmpty) {
      return Result.failure(ValidationFailure(fieldErrors: errors));
    }

    return _repository.login(
      email: params.email.trim(),
      password: params.password,
    );
  }
}
