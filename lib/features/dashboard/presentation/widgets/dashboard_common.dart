import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_fixtures.dart';

class DashboardPill extends StatelessWidget {
  const DashboardPill({
    required this.label,
    this.icon,
    this.onBanner = false,
    super.key,
  });

  final String label;
  final IconData? icon;
  final bool onBanner;

  @override
  Widget build(BuildContext context) {
    final bg = onBanner
        ? context.colorScheme.surface.withValues(alpha: 0.9)
        : context.colorScheme.primaryContainer;
    final fg = context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.xs,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: KpSpacing.m, color: fg),
            const Gap.xxs(horizontal: true),
          ],
          Text(
            label.toUpperCase(),
            style: context.textTheme.labelSmall?.copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}

class DashboardSectionHeader extends StatelessWidget {
  const DashboardSectionHeader({required this.title, this.action, super.key});

  final String title;
  final String? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        Text(
          action ?? context.l10n.dashboardViewAll,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class DashboardIconBox extends StatelessWidget {
  const DashboardIconBox({
    required this.icon,
    required this.boxColor,
    required this.iconColor,
    super.key,
  });

  final IconData icon;
  final Color boxColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(color: boxColor, borderRadius: KpRadii.allM),
      child: Icon(icon, color: iconColor),
    );
  }
}

class DashboardTagPill extends StatelessWidget {
  const DashboardTagPill({
    required this.label,
    required this.bg,
    required this.fg,
    super.key,
  });

  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
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

/// Overlapping member avatars with a "+N" overflow chip.
class AvatarStack extends StatelessWidget {
  const AvatarStack({required this.total, super.key});

  static const int _shown = 3;
  static const double _size = 32;
  static const double _step = 22;

  final int total;

  @override
  Widget build(BuildContext context) {
    final extra = total - _shown;
    final chips = <Widget>[
      for (var i = 0; i < _shown; i++)
        Positioned(
          left: i * _step,
          child: _avatar(
            context,
            color: context.colorScheme.primaryContainer,
            child: KpNetworkAvatar(
              url: kDashboardMemberAvatars[i % kDashboardMemberAvatars.length],
              radius: (_size - 4) / 2,
            ),
          ),
        ),
      if (extra > 0)
        Positioned(
          left: _shown * _step,
          child: _avatar(
            context,
            color: context.colorScheme.surfaceContainerHighest,
            child: Text('+$extra', style: context.textTheme.labelSmall),
          ),
        ),
    ];
    final width = (_shown + (extra > 0 ? 1 : 0)) * _step + (_size - _step);
    return SizedBox(
      height: _size,
      width: width,
      child: Stack(children: chips),
    );
  }

  Widget _avatar(
    BuildContext context, {
    required Widget child,
    required Color color,
  }) {
    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: context.colorScheme.surface, width: 2),
      ),
      child: child,
    );
  }
}
