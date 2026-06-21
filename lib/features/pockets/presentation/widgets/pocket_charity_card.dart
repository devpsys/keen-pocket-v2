import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/charity/charity.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';

/// Charity-drive entry for the pocket detail hub: donate into the pocket's
/// drive, and (organisers) start a new one.
class PocketCharityCard extends StatelessWidget {
  const PocketCharityCard({
    required this.pocket,
    required this.role,
    super.key,
  });

  final Pocket pocket;
  final PocketRole role;

  void _openDonate(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute(builder: (_) => CharityPage(pocketId: pocket.id)),
    );
  }

  void _openSetup(BuildContext context) {
    Navigator.of(
      context,
    ).push<bool>(MaterialPageRoute(builder: (_) => const CharitySetupPage()));
  }

  @override
  Widget build(BuildContext context) {
    final isOrganiser = role == PocketRole.organiser;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: KpRadii.allXl,
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.surfaceContainerHighest,
            width: 7,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(KpSpacing.s),
                decoration: const BoxDecoration(
                  color: KpColors.tertiary100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: KpColors.tertiary500,
                ),
              ),
              const Gap.s(horizontal: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.pocketCharityTitle,
                      style: context.textTheme.titleMedium,
                    ),
                    Text(
                      context.l10n.pocketCharitySubtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap.m(),
          KpButton(
            label: context.l10n.charityDonate,
            icon: Icons.volunteer_activism_rounded,
            onPressed: () => _openDonate(context),
          ),
          if (isOrganiser) ...[
            const Gap.s(),
            KpButton(
              label: context.l10n.pocketCharityStart,
              variant: KpButtonVariant.ghost,
              icon: Icons.add_circle_outline_rounded,
              onPressed: () => _openSetup(context),
            ),
          ],
        ],
      ),
    );
  }
}
