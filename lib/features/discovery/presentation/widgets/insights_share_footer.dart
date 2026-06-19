import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Footnote + "Share My Year" action shown at the foot of the insights screen.
class InsightsShareFooter extends StatelessWidget {
  const InsightsShareFooter({this.onShare, super.key});

  static const double _shareWidth = 220;

  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.insightsFootnote,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap.m(),
        SizedBox(
          width: _shareWidth,
          child: KpButton(
            label: context.l10n.insightsShareMyYear,
            icon: KpIcons.share,
            variant: KpButtonVariant.secondary,
            onPressed: onShare ?? () {},
          ),
        ),
      ],
    );
  }
}
