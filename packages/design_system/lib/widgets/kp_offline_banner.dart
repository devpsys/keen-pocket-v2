import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../spacing/kp_spacing.dart';

/// A thin "you're offline" strip. Caller controls visibility (e.g. from the
/// connectivity stream) and passes the already-localized [message].
class KpOfflineBanner extends StatelessWidget {
  const KpOfflineBanner({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.warningContainer,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: KpSpacing.m,
            vertical: KpSpacing.xs,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_off_outlined,
                size: KpSpacing.m,
                color: context.colors.onWarning,
              ),
              const Gap.xs(horizontal: true),
              Flexible(
                child: Text(
                  message,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colors.onWarning,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
