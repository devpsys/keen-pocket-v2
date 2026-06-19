import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// A read-only account field: a bold label above a disabled-looking container
/// that shows [value] with a trailing lock icon (design `settings`).
///
/// Used for the email and phone rows that can only be changed via support.
class SettingsLockedField extends StatelessWidget {
  const SettingsLockedField({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.labelLarge?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
        const Gap.xs(),
        Container(
          padding: const EdgeInsets.all(KpSpacing.m),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerHighest,
            borderRadius: KpRadii.allM,
            border: Border.all(color: scheme.outlineVariant, width: 2),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ),
              Icon(Icons.lock_rounded, color: scheme.outline),
            ],
          ),
        ),
      ],
    );
  }
}
