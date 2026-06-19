import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// A single notification/app-setting preference row: a tinted icon tile, a
/// title + subtitle, and an adaptive [Switch] (design `settings`).
class SettingsToggleRow extends StatelessWidget {
  const SettingsToggleRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  static const double _iconTile = 40;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: KpRadii.allL,
      ),
      child: Row(
        children: [
          Container(
            width: _iconTile,
            height: _iconTile,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: KpRadii.allS,
            ),
            child: Icon(icon, color: scheme.onPrimaryContainer),
          ),
          const Gap.s(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textTheme.bodyLarge),
                Text(
                  subtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Gap.s(horizontal: true),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: scheme.primary,
          ),
        ],
      ),
    );
  }
}
