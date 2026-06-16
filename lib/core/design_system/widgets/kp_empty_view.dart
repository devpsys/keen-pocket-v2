import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../spacing/kp_spacing.dart';

/// Standard empty state. Title/message must be passed in already localized.
class KpEmptyView extends StatelessWidget {
  const KpEmptyView({
    required this.title,
    required this.message,
    this.icon = Icons.inbox_outlined,
    super.key,
  });

  final String title;
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(KpSpacing.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: KpSpacing.xxl,
              color: context.colorScheme.onSurfaceVariant,
            ),
            const Gap.m(),
            Text(title, style: context.textTheme.titleMedium),
            const Gap.xs(),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
