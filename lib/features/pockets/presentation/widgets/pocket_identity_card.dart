import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Left-rail identity card for the tablet pocket detail hub: pocket icon, name,
/// tagline, the headline target/per-hand/duration tiles, the organiser row and
/// a "Share Pocket" outlined action.
class PocketIdentityCard extends StatelessWidget {
  const PocketIdentityCard({required this.pocket, super.key});

  static const double _iconBox = 64;
  static const double _iconSize = 36;
  static const double _avatar = 40;

  final Pocket pocket;

  @override
  Widget build(BuildContext context) {
    final target = Money(pocket.handPrice.kobo * pocket.totalHands);
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: _iconBox,
            height: _iconBox,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: KpRadii.allL,
            ),
            child: Icon(
              KpIcons.savings,
              size: _iconSize,
              color: context.colorScheme.onPrimary,
            ),
          ),
          const Gap.m(),
          Text(
            pocket.name,
            style: context.textTheme.titleLarge?.copyWith(
              // fontWeight: FontWeight.w500,
            ),
          ),
          const Gap.xxs(),
          Text(
            kPocketTagline,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.m(),
          _IdentityTile(
            label: context.l10n.pocketDetailTarget,
            value: target.formatShort(),
            valueColor: context.colorScheme.primary,
          ),
          _IdentityTile(
            label: context.l10n.pocketDetailPerHandShort,
            value: pocket.handPrice.formatShort(),
          ),
          _IdentityTile(
            label: context.l10n.pocketDetailDuration,
            value: context.l10n.pocketDetailMonths(kPocketDurationMonths),
          ),
          const Gap.m(),
          Divider(color: context.colorScheme.outlineVariant),
          const Gap.m(),
          Row(
            children: [
              CircleAvatar(
                radius: _avatar / 2,
                backgroundColor: context.colorScheme.primaryContainer,
                child: Text(
                  kPocketOrganiserName.characters.first,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const Gap.s(horizontal: true),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kPocketOrganiserName,
                    style: context.textTheme.labelLarge,
                  ),
                  Text(
                    context.l10n.pocketOrganiser,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.pocketDetailSharePocket,
            icon: Icons.share_rounded,
            variant: KpButtonVariant.ghost,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

/// Labelled tile (label left, value right) used inside [PocketIdentityCard].
class _IdentityTile extends StatelessWidget {
  const _IdentityTile({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: KpRadii.allM,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: context.textTheme.labelLarge?.copyWith(
              color: valueColor ?? context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
