import 'package:flutter/material.dart';

import '../../core/design_system/design_system.dart';
import '../../core/localization/l10n_extension.dart';

/// Standard error state with an optional retry action.
///
/// [message] must already be localized (use `failure.localizedMessage(context)`).
class AppErrorView extends StatelessWidget {
  const AppErrorView({required this.message, this.onRetry, super.key});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: AppSpacing.xxl,
              color: context.colorScheme.error,
            ),
            const Gap.m(),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium,
            ),
            if (onRetry != null) ...[
              const Gap.l(),
              AppButton(label: context.l10n.retry, onPressed: onRetry),
            ],
          ],
        ),
      ),
    );
  }
}
