import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/dashboard/presentation/view_models/dashboard_view.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_common.dart';

/// A pocket card with the colored top banner — used in the horizontal rail
/// (phone) and the vertical "My Pockets" column (tablet).
class PocketBannerCard extends StatelessWidget {
  const PocketBannerCard({
    required this.pocket,
    required this.index,
    this.onOpenPocket,
    super.key,
  });

  static const double _bannerHeight = 64;

  final DashboardPocketView pocket;
  final int index;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    final palette = [
      context.colorScheme.primary,
      context.colorScheme.error,
      context.colors.warning,
    ];
    final banner = palette[index % palette.length];
    return GestureDetector(
      onTap: () => onOpenPocket?.call(pocket.id),
      child: ClipRRect(
        borderRadius: KpRadii.allXl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: _bannerHeight,
              color: banner,
              padding: const EdgeInsets.all(KpSpacing.s),
              alignment: Alignment.topRight,
              child: DashboardPill(label: pocket.tag, onBanner: true),
            ),
            Container(
              color: context.colorScheme.surface,
              padding: const EdgeInsets.all(KpSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    pocket.name,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.dashboardPerHand(
                      pocket.handPrice.formatShort(),
                    ),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const Gap.s(),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: KpSpacing.m,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      const Gap.xxs(horizontal: true),
                      Text(
                        pocket.scheduleLabel,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Horizontal rail of pocket cards (phone).
class PocketsRail extends StatelessWidget {
  const PocketsRail({required this.pockets, this.onOpenPocket, super.key});

  static const double _railHeight = 188;
  static const double _cardWidth = 260;

  final List<DashboardPocketView> pockets;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _railHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: pockets.length,
        separatorBuilder: (_, _) => const Gap.s(horizontal: true),
        itemBuilder: (context, i) => SizedBox(
          width: _cardWidth,
          child: PocketBannerCard(
            pocket: pockets[i],
            index: i,
            onOpenPocket: onOpenPocket,
          ),
        ),
      ),
    );
  }
}
