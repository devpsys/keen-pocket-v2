import 'package:core/core.dart';

import 'package:keenpockets/features/profile/domain/entities/profile.dart';

/// Reads (and later updates) the signed-in user's profile.
abstract interface class ProfileRepository {
  Future<Result<Profile>> getProfile();
}
