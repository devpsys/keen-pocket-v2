import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_card.dart';

/// Phone layout for the Pockets tab (design `my_pockets_2`): pockets split into
/// "I organise" and "I'm in" sections of gradient-banner cards.
class PocketsListView extends StatelessWidget {
  const PocketsListView({required this.pockets, this.onOpenPocket, super.key});

  final List<Pocket> pockets;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    final uid = getIt<SessionManager>().currentUser?.id ?? '';
    final organise = pockets
        .where((p) => p.roleOf(uid) == PocketRole.organiser)
        .toList();
    final joined = pockets
        .where((p) => p.roleOf(uid) != PocketRole.organiser)
        .toList();
    final activeCount = organise.where((p) => !p.isFull).length;

    return ListView(
      // Extra bottom inset so the last card clears the floating "Create" button.
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.m,
        KpSpacing.m,
        KpSpacing.xxxl + KpSpacing.m,
      ),
      children: [
        if (organise.isNotEmpty) ...[
          _SectionHeader(
            title: context.l10n.pocketsSectionOrganise,
            trailing: _ActiveCountPill(count: activeCount),
          ),
          const Gap.s(),
          for (final pocket in organise) ...[
            PocketCard(
              pocket: pocket,
              onTap: () => onOpenPocket?.call(pocket.id),
            ),
            const Gap.m(),
          ],
          const Gap.s(),
        ],
        if (joined.isNotEmpty) ...[
          _SectionHeader(title: context.l10n.pocketsSectionIn),
          const Gap.s(),
          for (final pocket in joined) ...[
            PocketCard(
              pocket: pocket,
              onTap: () => onOpenPocket?.call(pocket.id),
            ),
            const Gap.m(),
          ],
        ],
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toUpperCase(),
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSurface,
            letterSpacing: 1,
          ),
        ),
        ?trailing,
      ],
    );
  }
}

class _ActiveCountPill extends StatelessWidget {
  const _ActiveCountPill({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: KpSpacing.s,
        vertical: KpSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(KpRadii.pill),
      ),
      child: Text(
        context.l10n.pocketsActiveCount(count),
        style: context.textTheme.labelSmall?.copyWith(
          color: context.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
