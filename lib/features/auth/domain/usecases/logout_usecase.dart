import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/result/result.dart';
import 'package:keenpockets/core/usecase/usecase.dart';
import 'package:keenpockets/features/auth/domain/repositories/auth_repository.dart';

/// Ends the current session.
@injectable
class LogoutUseCase implements UseCase<void, NoParams> {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Result<void>> call(NoParams params) => _repository.logout();
}
