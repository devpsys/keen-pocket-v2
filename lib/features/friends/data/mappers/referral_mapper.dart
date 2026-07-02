import 'package:keenpockets/features/friends/data/dtos/referral_dto.dart';
import 'package:keenpockets/features/friends/domain/entities/referral.dart';

ReferralStatus _status(String raw) => switch (raw) {
  'qualified' => ReferralStatus.qualified,
  'rewarded' => ReferralStatus.rewarded,
  _ => ReferralStatus.pending,
};

extension ReferralEntryDtoMapper on ReferralEntryDto {
  ReferralEntry toEntity() => ReferralEntry(
    id: id,
    name: name,
    joinedLabel: joinedLabel,
    status: _status(status),
    detail: detail,
    rewardAmount: rewardAmount,
  );
}

extension ReferralDtoMapper on ReferralDto {
  Referral toEntity() => Referral(
    inviteLink: inviteUrl,
    referralCode: inviteCode,
    invited: stats.invited,
    qualified: stats.qualified,
    rewarded: stats.rewarded,
    circle: circle.map((e) => e.toEntity()).toList(),
  );
}
