import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_dto.freezed.dart';
part 'referral_dto.g.dart';

/// Referral funnel counters (`GET /referrals` → `stats`).
@freezed
abstract class ReferralStatsDto with _$ReferralStatsDto {
  const factory ReferralStatsDto({
    required int invited,
    required int qualified,
    required int rewarded,
    int? earned, // total keens earned (not currently shown)
  }) = _ReferralStatsDto;

  factory ReferralStatsDto.fromJson(Map<String, dynamic> json) =>
      _$ReferralStatsDtoFromJson(json);
}

/// A referred friend in "Your Circle".
@freezed
abstract class ReferralEntryDto with _$ReferralEntryDto {
  const factory ReferralEntryDto({
    required String id,
    required String name,
    @JsonKey(name: 'joined_label') required String joinedLabel,
    required String status, // pending | qualified | rewarded
    String? detail,
    @JsonKey(name: 'reward_amount') String? rewardAmount,
  }) = _ReferralEntryDto;

  factory ReferralEntryDto.fromJson(Map<String, dynamic> json) =>
      _$ReferralEntryDtoFromJson(json);
}

/// Wire model for `GET /referrals` (see docs/API_SPEC.md §13).
@freezed
abstract class ReferralDto with _$ReferralDto {
  const factory ReferralDto({
    @JsonKey(name: 'invite_url') required String inviteUrl,
    @JsonKey(name: 'invite_code') required String inviteCode,
    required ReferralStatsDto stats,
    @Default(<ReferralEntryDto>[]) List<ReferralEntryDto> circle,
  }) = _ReferralDto;

  factory ReferralDto.fromJson(Map<String, dynamic> json) =>
      _$ReferralDtoFromJson(json);
}
