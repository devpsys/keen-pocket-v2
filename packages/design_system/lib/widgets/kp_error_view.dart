import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../spacing/kp_spacing.dart';
import 'kp_button.dart';

/// Standard failure/permission state with an optional retry action.
///
/// [message] and [retryLabel] must already be localized by the caller — the
/// design system stays free of app localization (use
/// `failure.localizedMessage(context)` and `context.l10n.retry`).
class KpErrorView extends StatelessWidget {
  const KpErrorView({
    required this.message,
    this.onRetry,
    this.retryLabel,
    this.icon = Icons.error_outline,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;
  final String? retryLabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final showRetry = onRetry != null && retryLabel != null;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: KpSpacing.xxl, color: context.colorScheme.error),
            const Gap.m(),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium,
            ),
            if (showRetry) ...[
              const Gap.l(),
              KpButton(label: retryLabel!, onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
