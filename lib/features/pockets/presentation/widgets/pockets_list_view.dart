import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_card.dart';

/// Phone layout for the Pockets tab (my_pockets_1): a Mr K tip, the user's
/// pocket cards, a create card, and the browse-public footer.
class PocketsListView extends StatelessWidget {
  const PocketsListView({
    required this.pockets,
    required this.onCreate,
    this.onOpenPocket,
    super.key,
  });

  final List<Pocket> pockets;
  final VoidCallback onCreate;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.m),
      children: [
        const PocketsTipCard(),
        const Gap.m(),
        for (final pocket in pockets) ...[
          PocketCard(
            pocket: pocket,
            onTap: () => onOpenPocket?.call(pocket.id),
          ),
          const Gap.s(),
        ],
        const Gap.xs(),
        CreatePocketDashedCard(onTap: onCreate),
        const Gap.l(),
        KpButton(
          label: context.l10n.pocketBrowsePublic,
          icon: KpIcons.discover,
          caps: true,
          onPressed: () {},
        ),
        const Gap.s(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_rounded,
              size: KpSpacing.m,
              color: context.colorScheme.onSurfaceVariant,
            ),
            const Gap.xxs(horizontal: true),
            Flexible(
              child: Text(
                context.l10n.pocketsInsuredNote,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// The italic Mr K tip shown atop the phone pockets list.
class PocketsTipCard extends StatelessWidget {
  const PocketsTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.m),
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          const KpMascot(size: 48),
          const Gap.s(horizontal: true),
          Expanded(
            child: Text(
              context.l10n.pocketsTip,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSecondaryContainer,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Outlined "start saving" card that opens the create-pocket flow (phone).
class CreatePocketDashedCard extends StatelessWidget {
  const CreatePocketDashedCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: KpSpacing.l),
        decoration: BoxDecoration(
          borderRadius: KpRadii.allXl,
          border: Border.all(color: context.colorScheme.outline, width: 2),
        ),
        child: Column(
          children: [
            Icon(
              KpIcons.add,
              color: context.colorScheme.primary,
              size: KpSpacing.xl,
            ),
            const Gap.xs(),
            Text(
              context.l10n.pocketStartSaving.toUpperCase(),
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
