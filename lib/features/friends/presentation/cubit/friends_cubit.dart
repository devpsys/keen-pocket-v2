import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/friends/domain/entities/referral.dart';
import 'package:keenpockets/features/friends/domain/usecases/get_referrals.dart';
import 'package:keenpockets/features/friends/presentation/cubit/friends_state.dart';
import 'package:keenpockets/features/friends/presentation/view_models/referral_view.dart'
    as vm;

/// Loads the refer-&-earn summary via [GetReferrals] and projects the entity
/// into the [FriendsState] presentation shape.
@injectable
class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this._getReferrals) : super(const FriendsState());

  final GetReferrals _getReferrals;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getReferrals(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (r) => state.copyWith(
          status: StateStatus.success,
          inviteLink: r.inviteLink,
          referralCode: r.referralCode,
          invited: r.invited,
          qualified: r.qualified,
          rewarded: r.rewarded,
          circle: r.circle.map((e) => e.toView()).toList(),
          failure: null,
        ),
      ),
    );
  }
}

extension on ReferralEntry {
  vm.ReferralView toView() => vm.ReferralView(
    id: id,
    name: name,
    joinedLabel: joinedLabel,
    status: switch (status) {
      ReferralStatus.pending => vm.ReferralStatus.pending,
      ReferralStatus.qualified => vm.ReferralStatus.qualified,
      ReferralStatus.rewarded => vm.ReferralStatus.rewarded,
    },
    detail: detail,
    rewardAmount: rewardAmount,
  );
}
