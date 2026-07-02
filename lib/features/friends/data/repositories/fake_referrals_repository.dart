import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/friends/domain/entities/referral.dart';
import 'package:keenpockets/features/friends/domain/repositories/referrals_repository.dart';

/// Dev-only stub so refer-&-earn renders without a backend. Mirrors the old
/// presentation fixtures. `prod`/`staging` use [ReferralsRepositoryImpl].
@LazySingleton(as: ReferralsRepository, env: ['dev'])
class FakeReferralsRepository implements ReferralsRepository {
  const FakeReferralsRepository();

  @override
  Future<Result<Referral>> getReferrals() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const Right(
      Referral(
        inviteLink: 'keenpocket.app/ref/kevin9921',
        referralCode: 'KEEN-9921',
        invited: 8,
        qualified: 3,
        rewarded: 1,
        circle: [
          ReferralEntry(
            id: 'r1',
            name: 'Tunde Adebayo',
            joinedLabel: 'Joined 2 days ago',
            status: ReferralStatus.pending,
            detail: 'Pending account setup',
          ),
          ReferralEntry(
            id: 'r2',
            name: 'Chidi Okoro',
            joinedLabel: 'Joined 5 days ago',
            status: ReferralStatus.qualified,
            detail: 'First deposit made',
          ),
          ReferralEntry(
            id: 'r3',
            name: 'Sarah Williams',
            joinedLabel: 'Joined 1 week ago',
            status: ReferralStatus.rewarded,
            detail: 'Rewards paid out',
            rewardAmount: '50 keens',
          ),
        ],
      ),
    );
  }
}
