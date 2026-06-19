import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';

/// Mr K trust tip shown at the foot of the Discover list.
class DiscoverTipCard extends StatelessWidget {
  const DiscoverTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const KpMascot(size: 96),
        const Gap.s(),
        Text(
          context.l10n.discoverTipTitle,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        const Gap.xxs(),
        Text(
          context.l10n.discoverTip,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
