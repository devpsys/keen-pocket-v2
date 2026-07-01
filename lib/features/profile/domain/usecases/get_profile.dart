import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/profile/domain/entities/profile.dart';
import 'package:keenpockets/features/profile/domain/repositories/profile_repository.dart';

/// Fetches the signed-in user's profile (`GET /me`).
@injectable
class GetProfile implements UseCase<Profile, NoParams> {
  const GetProfile(this._repository);

  final ProfileRepository _repository;

  @override
  Future<Result<Profile>> call(NoParams params) => _repository.getProfile();
}
