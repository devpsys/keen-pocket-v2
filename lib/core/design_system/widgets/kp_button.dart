import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../spacing/kp_spacing.dart';

/// Primary action button built entirely from design tokens.
///
/// Handles its own loading state so screens never wire a spinner manually.
class KpButton extends StatelessWidget {
  const KpButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: KpSpacing.l,
              width: KpSpacing.l,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.colorScheme.onPrimary,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: KpSpacing.l),
                  const Gap.xs(horizontal: true),
                ],
                Text(label),
              ],
            ),
    );
  }
}
