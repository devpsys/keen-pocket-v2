import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/profile/domain/entities/profile.dart';
import 'package:keenpockets/features/profile/domain/repositories/profile_repository.dart';

/// Dev-only stub so the profile screen renders without a backend. Identity comes
/// from the current session (mirroring the old cubit); reputation figures are
/// placeholders. `prod`/`staging` use [ProfileRepositoryImpl].
@LazySingleton(as: ProfileRepository, env: ['dev'])
class FakeProfileRepository implements ProfileRepository {
  const FakeProfileRepository(this._session);

  final SessionManager _session;

  @override
  Future<Result<Profile>> getProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final user = _session.currentUser;
    return Right(
      Profile(
        name: user?.name ?? 'Guest',
        phone: '+1 (555) 0123-4567',
        level: 12,
        trustScore: 92,
        tier: 'Keen Pioneer',
        tierBlurb: "You're in the top 5% of reliable savers in your region!",
        kycVerified: user?.kycVerified ?? false,
        paymentReliability: 98,
        pocketsJoined: 12,
        adashisCompleted: 5,
        avgRating: 4.9,
        avatarUrl: user?.avatarUrl,
      ),
    );
  }
}
