import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/discovery/presentation/view_models/discover_item_view.dart';

/// A public pocket/circle card in the Discover list (design `discover_pockets`).
class DiscoverPocketCard extends StatelessWidget {
  const DiscoverPocketCard({
    required this.item,
    this.onJoin,
    this.onTap,
    super.key,
  });

  static const double _joinWidth = 104;

  final DiscoverItemView item;
  final VoidCallback? onJoin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return KpCard.interactive(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainerHighest,
                  borderRadius: KpRadii.allM,
                  border: Border.all(color: context.colorScheme.outlineVariant),
                ),
                child: Text(item.emoji, style: context.textTheme.headlineSmall),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: context.textTheme.titleLarge),
                    const Gap.xxs(),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            context.l10n.discoverAdmin(item.adminName),
                            style: context.textTheme.labelSmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Gap.xxs(horizontal: true),
                        Icon(
                          KpIcons.verified,
                          size: KpSpacing.m,
                          color: context.colorScheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap.s(horizontal: true),
              _BadgePill(badge: item.badge),
            ],
          ),
          const Divider(height: KpSpacing.l),
          Row(
            children: [
              Expanded(
                child: _Metric(
                  label: context.l10n.discoverContribution,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        item.contribution.format(),
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        context.l10n.discoverPerUnit(item.contributionUnit),
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _Metric(
                  label: item.metricIsStartDate
                      ? context.l10n.discoverStartDate
                      : context.l10n.discoverMembers,
                  child: Text(
                    item.metricValue,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: KpSpacing.l),
          Row(
            children: [
              Expanded(child: _Rating(rating: item.rating)),
              SizedBox(
                width: _joinWidth,
                child: KpButton(
                  label: context.l10n.discoverJoin,
                  caps: true,
                  onPressed: onJoin ?? () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap.xxs(),
        child,
      ],
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final filled = rating.round();
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            i < filled ? Icons.star_rounded : Icons.star_border_rounded,
            size: KpSpacing.l,
            color: context.colors.warning,
          ),
        const Gap.xxs(horizontal: true),
        Text(
          context.l10n.discoverRating(rating.toString()),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _BadgePill extends StatelessWidget {
  const _BadgePill({required this.badge});

  final DiscoverBadge badge;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg, String label) = switch (badge) {
      DiscoverBadge.kycVerified => (
        context.colors.successContainer,
        context.colors.success,
        context.l10n.discoverBadgeKyc,
      ),
      DiscoverBadge.official => (
        context.colorScheme.primaryContainer,
        context.colorScheme.onPrimaryContainer,
        context.l10n.discoverBadgeOfficial,
      ),
      DiscoverBadge.adashi => (
        context.colorScheme.secondaryContainer,
        context.colorScheme.onSecondaryContainer,
        context.l10n.discoverBadgeAdashi,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        label.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
