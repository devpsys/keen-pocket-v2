import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/friends/presentation/view_models/referral_view.dart';

part 'friends_state.freezed.dart';

@freezed
abstract class FriendsState with _$FriendsState {
  const factory FriendsState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String inviteLink,
    @Default('') String referralCode,
    @Default(0) int invited,
    @Default(0) int qualified,
    @Default(0) int rewarded,
    @Default(<ReferralView>[]) List<ReferralView> circle,
    Failure? failure,
  }) = _FriendsState;
}
