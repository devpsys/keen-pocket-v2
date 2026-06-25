import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/referral_fixtures.dart';

/// PRESENTATION-ONLY: sample-backed refer-&-earn screen (designs `refer_earn` /
/// `_tablet`). Swap for a real referrals use case when the API exists.
@injectable
class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit() : super(const FriendsState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        inviteLink: kReferralInviteLink,
        referralCode: kReferralCode,
        invited: kReferralInvited,
        qualified: kReferralQualified,
        rewarded: kReferralRewarded,
        circle: kReferralCircle,
      ),
    );
  }
}
