import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/trust/trust.dart';

/// Hub header (design `adashi_hub`): the group admin's portrait, name, a gold
/// reputation pill, a share action, and a full-width "Rate admin" candy button.
class AdashiAdminHeader extends StatelessWidget {
  const AdashiAdminHeader({required this.detail, super.key});

  final AdashiDetailView detail;

  static const double _avatar = 64;

  Future<void> _rate(BuildContext context) =>
      RateOrganiserSheet.show(context, organiserName: detail.adminName);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: KpRadii.allL,
                border: Border.all(
                  color: context.colorScheme.outlineVariant,
                  width: 2,
                ),
              ),
              child: KpNetworkImage(
                url: detail.adminAvatarUrl,
                width: _avatar,
                height: _avatar,
                borderRadius: KpRadii.allL,
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.adashiHubAdminName(detail.adminName),
                    style: context.textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap.xs(),
                  _ReputationPill(score: detail.reputation),
                ],
              ),
            ),
            const Gap.s(horizontal: true),
            _IconBox(icon: KpIcons.share, onTap: () {}),
          ],
        ),
        const Gap.m(),
        _RateAdminButton(onTap: () => _rate(context)),
      ],
    );
  }
}

/// Gold star reputation pill ("★ 4.9 reputation").
class _ReputationPill extends StatelessWidget {
  const _ReputationPill({required this.score});

  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star_rounded,
            size: KpSpacing.m,
            color: context.colorScheme.onSecondaryContainer,
          ),
          const Gap.xxs(horizontal: true),
          Flexible(
            child: Text(
              context.l10n.adashiHubReputation(score),
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Small square icon button (share).
class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceContainerHigh,
      borderRadius: KpRadii.allM,
      child: InkWell(
        onTap: onTap,
        borderRadius: KpRadii.allM,
        child: Padding(
          padding: const EdgeInsets.all(KpSpacing.s),
          child: Icon(icon, color: context.colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}

/// White candy outline button used for "Rate admin".
class _RateAdminButton extends StatelessWidget {
  const _RateAdminButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: KpSpacing.xxs),
        padding: const EdgeInsets.symmetric(vertical: KpSpacing.m),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerLowest,
          borderRadius: KpRadii.allL,
          border: Border.all(
            color: context.colorScheme.outlineVariant,
            width: 2,
          ),
          // Flat candy shadow in the design's `outline` colour (`0 4px 0 0`).
          boxShadow: const [
            BoxShadow(
              color: KpColors.neutral500,
              offset: Offset(0, KpSpacing.xxs),
            ),
          ],
        ),
        child: Text(
          context.l10n.adashiHubRateAdmin,
          style: context.textTheme.labelLarge,
        ),
      ),
    );
  }
}
