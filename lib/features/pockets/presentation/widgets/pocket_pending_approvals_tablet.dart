import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';

/// Right-rail "pending approvals" card: a join request with accept/decline
/// circular icon buttons.
class PocketPendingApprovalsTablet extends StatelessWidget {
  const PocketPendingApprovalsTablet({super.key});

  static const double _avatar = 32;

  @override
  Widget build(BuildContext context) {
    return KpCard(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.pocketDetailPendingApprovals.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap.s(),
          Container(
            padding: const EdgeInsets.all(KpSpacing.s),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerLow,
              borderRadius: KpRadii.allM,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: _avatar / 2,
                  backgroundColor: context.colorScheme.primaryContainer,
                  child: Text(
                    kPocketJoinRequestName.characters.first,
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const Gap.s(horizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kPocketJoinRequestName,
                        style: context.textTheme.labelLarge,
                      ),
                      Text(
                        context.l10n.pocketDetailNewJoinRequest,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                _ActionButton(
                  icon: Icons.check,
                  background: context.colors.success,
                  foreground: context.colors.onSuccess,
                ),
                const Gap.xs(horizontal: true),
                _ActionButton(
                  icon: Icons.close,
                  background: context.colorScheme.error,
                  foreground: context.colorScheme.onError,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A small circular icon button used for accept/decline actions.
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.background,
    required this.foreground,
  });

  static const double _box = 32;
  static const double _iconSize = 18;

  final IconData icon;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: _box,
        height: _box,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Icon(icon, size: _iconSize, color: foreground),
      ),
    );
  }
}
