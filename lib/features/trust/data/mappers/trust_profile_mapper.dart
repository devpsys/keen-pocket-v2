import 'package:keenpockets/features/trust/data/dtos/trust_profile_dto.dart';
import 'package:keenpockets/features/trust/domain/entities/trust_profile.dart';

extension RatingDtoMapper on RatingDto {
  Rating toEntity() => Rating(
    author: author,
    stars: stars,
    comment: comment,
    context: context,
    avatarUrl: avatarUrl,
  );
}

extension TrustProfileDtoMapper on TrustProfileDto {
  TrustProfile toEntity() => TrustProfile(
    score: score,
    band: band,
    kycVerified: kycVerified,
    ratings: ratings.map((r) => r.toEntity()).toList(),
    memberName: memberName,
    memberSince: memberSince,
    rank: rank,
    avatarUrl: avatarUrl,
    paymentReliability: paymentReliability,
    pocketsJoined: pocketsJoined,
    adashisCompleted: adashisCompleted,
    avgRating: avgRating,
  );
}
