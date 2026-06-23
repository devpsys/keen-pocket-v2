import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/features/profile/presentation/view_models/profile_view.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_achievements.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_header.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_kyc_card.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_reviews.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_stat_grid.dart';
import 'package:keenpockets/features/profile/presentation/widgets/profile_trust_card.dart';

/// Composed "my profile" body (design `my_profile`): identity header, trust
/// score, KYC prompt, stat grid, achievements and recent reviews. On wide
/// screens the column is centered within a comfortable max width.
class ProfileMyView extends StatelessWidget {
  const ProfileMyView({
    required this.profile,
    this.onVerify,
    this.onAchievements,
    this.onReviews,
    this.onViewPublic,
    this.onViewTrust,
    super.key,
  });

  static const double _maxWidth = 640;

  final ProfileView profile;
  final VoidCallback? onVerify;
  final VoidCallback? onAchievements;
  final VoidCallback? onReviews;
  final VoidCallback? onViewPublic;
  final VoidCallback? onViewTrust;

  @override
  Widget build(BuildContext context) {
    final header = ProfileHeader(profile: profile, onTapAvatar: onViewPublic);
    final kyc = profile.kycVerified
        ? null
        : ProfileKycCheckCard(onVerify: onVerify);
    final stats = ProfileStatGrid(profile: profile);
    final achievements = ProfileAchievements(onViewAll: onAchievements);
    final reviews = ProfileReviews(onSeeAll: onReviews);

    // Tablet/desktop: a three-column layout (design `my_profile_tablet`).
    // The left column is a single identity card (header + trust content).
    if (context.isExpanded) {
      return ListView(
        padding: const EdgeInsets.all(KpSpacing.xl),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    KpCard(
                      padding: const EdgeInsets.all(KpSpacing.l),
                      child: Column(
                        children: [
                          header,
                          const Gap.l(),
                          ProfileTrustContent(
                            profile: profile,
                            onTap: onViewTrust,
                          ),
                        ],
                      ),
                    ),
                    if (kyc != null) ...[const Gap.m(), kyc],
                  ],
                ),
              ),
              const Gap.l(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [stats, const Gap.l(), achievements],
                ),
              ),
              const Gap.l(horizontal: true),
              Expanded(child: reviews),
            ],
          ),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: KpSpacing.m),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap.l(),
                header,
                const Gap.l(),
                ProfileTrustCard(profile: profile, onTap: onViewTrust),
                if (kyc != null) ...[const Gap.m(), kyc],
                const Gap.l(),
                stats,
                const Gap.xl(),
                achievements,
                const Gap.xl(),
                reviews,
                const Gap.l(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
