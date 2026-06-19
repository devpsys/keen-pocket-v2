import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_card.dart';

/// Phone layout for the Adashi tab (design `adashi_circles`): a "My Adashi
/// Groups" header with an active-count pill, then a column of circle cards.
class AdashiListView extends StatelessWidget {
  const AdashiListView({required this.circles, this.onOpenAdashi, super.key});

  final List<AdashiSummaryView> circles;
  final ValueChanged<String>? onOpenAdashi;

  @override
  Widget build(BuildContext context) {
    final activeCount = circles.where((c) => c.isActive).length;

    return ListView(
      // Extra bottom inset so the last card clears the floating "Create" button.
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxxl + KpSpacing.m,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                context.l10n.adashiMyGroupsTitle,
                style: context.textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Gap.s(horizontal: true),
            _ActiveCountPill(count: activeCount),
          ],
        ),
        const Gap.l(),
        for (final circle in circles) ...[
          AdashiCard(
            adashi: circle,
            onTap: () => onOpenAdashi?.call(circle.id),
          ),
          const Gap.l(),
        ],
      ],
    );
  }
}

/// Gold "{n} Active" pill beside the section title.
class _ActiveCountPill extends StatelessWidget {
  const _ActiveCountPill({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        // Light "secondary-fixed" gold (#ffdf92) with near-black text, per design.
        color: KpColors.gold100,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        context.l10n.adashiActiveCount(count),
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSurface,
        ),
      ),
    );
  }
}
