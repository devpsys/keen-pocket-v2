import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';
import 'package:keenpockets/features/trust/trust.dart';

/// Member roster card for the pocket detail hub.
class PocketMembersSection extends StatelessWidget {
  const PocketMembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.pocketDetailMembers,
          style: context.textTheme.titleLarge,
        ),
        const Gap.s(),
        KpCard(
          child: Column(
            children: [
              for (final m in kPocketMembers)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: KpSpacing.xs),
                  child: Row(
                    children: [
                      CircleAvatar(child: Text(m.name.characters.first)),
                      const Gap.s(horizontal: true),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m.name, style: context.textTheme.titleMedium),
                            Text(
                              context.l10n.pocketMemberHands(m.hands),
                              style: context.textTheme.labelSmall?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (m.kyc) const KycBadge(showLabel: false),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
