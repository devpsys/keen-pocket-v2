import 'package:keenpockets/features/profile/data/dtos/profile_dto.dart';
import 'package:keenpockets/features/profile/domain/entities/profile.dart';

/// Wire model → domain entity.
extension ProfileDtoMapper on ProfileDto {
  Profile toEntity() => Profile(
    name: name,
    phone: phone,
    level: level,
    trustScore: trustScore,
    tier: tier,
    tierBlurb: tierBlurb,
    kycVerified: kycVerified,
    paymentReliability: paymentReliability,
    pocketsJoined: pocketsJoined,
    adashisCompleted: adashisCompleted,
    avgRating: avgRating,
    avatarUrl: avatarUrl,
  );
}
