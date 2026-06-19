import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/profile/presentation/widgets/public_profile_fixtures.dart';

/// "Ratings Received" list with reviewer photo, stars and an italic body, plus
/// an "Add a Recommendation" CTA.
class PublicProfileRatings extends StatelessWidget {
  const PublicProfileRatings({this.onRecommend, super.key});

  static const double _recommendWidth = 280;

  final VoidCallback? onRecommend;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.publicProfileRatingsReceived,
          style: context.textTheme.titleLarge,
        ),
        const Gap.m(),
        for (final r in kPublicRatings) ...[
          _RatingItem(rating: r),
          const Gap.s(),
        ],
        const Gap.m(),
        Center(
          child: SizedBox(
            width: _recommendWidth,
            child: KpButton(
              label: context.l10n.publicProfileAddRecommendation,
              icon: Icons.rate_review_rounded,
              onPressed: onRecommend ?? () {},
            ),
          ),
        ),
      ],
    );
  }
}

class _RatingItem extends StatelessWidget {
  const _RatingItem({required this.rating});

  final PublicRating rating;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KpNetworkAvatar(url: rating.avatarUrl, radius: KpSpacing.l),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        rating.author,
                        style: context.textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap.s(horizontal: true),
                    _Stars(filled: rating.stars),
                  ],
                ),
                const Gap.xs(),
                Text(
                  rating.body,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars({required this.filled});

  final int filled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            i < filled ? Icons.star_rounded : Icons.star_border_rounded,
            size: KpSpacing.m,
            color: context.colors.warning,
          ),
      ],
    );
  }
}
