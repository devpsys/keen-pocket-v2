import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/session/session_manager.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/start_new_group_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/tablet_pocket_card.dart';

/// Tablet layout for the Pockets tab (my_pockets_tablet): a welcome row, an
/// "organise" grid, an "in" grid, and a reward tip card.
class PocketsTabletView extends StatelessWidget {
  const PocketsTabletView({
    required this.pockets,
    required this.onCreate,
    this.onOpenPocket,
    super.key,
  });

  static const double _createWidth = 240;

  final List<Pocket> pockets;
  final VoidCallback onCreate;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    final user = getIt<SessionManager>().currentUser;
    final uid = user?.id ?? '';
    final organise = pockets
        .where((p) => p.roleOf(uid) == PocketRole.organiser)
        .toList();
    final joined = pockets
        .where((p) => p.roleOf(uid) != PocketRole.organiser)
        .toList();

    return ListView(
      padding: const EdgeInsets.all(KpSpacing.xl),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.pocketsMyTitle,
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap.xxs(),
                  Text(
                    context.l10n.pocketsSubtitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Gap.m(horizontal: true),
            SizedBox(
              width: _createWidth,
              child: KpButton(
                label: context.l10n.pocketsCreateNew,
                icon: KpIcons.add,
                onPressed: onCreate,
              ),
            ),
          ],
        ),
        const Gap.xl(),
        PocketSectionHeader(
          icon: Icons.star_rounded,
          tint: context.colorScheme.primary,
          title: context.l10n.pocketsSectionOrganise,
        ),
        const Gap.m(),
        PocketsGrid(
          pockets: organise,
          organiser: true,
          onOpenPocket: onOpenPocket,
          onCreate: onCreate,
        ),
        const Gap.xl(),
        PocketSectionHeader(
          icon: KpIcons.groups,
          tint: context.colorScheme.secondary,
          title: context.l10n.pocketsSectionIn,
        ),
        const Gap.m(),
        PocketsGrid(
          pockets: joined,
          organiser: false,
          onOpenPocket: onOpenPocket,
        ),
        const Gap.xl(),
        PocketsRewardCard(name: user?.name ?? ''),
      ],
    );
  }
}

/// A tinted-icon section heading used to group pockets on tablet.
class PocketSectionHeader extends StatelessWidget {
  const PocketSectionHeader({
    required this.icon,
    required this.tint,
    required this.title,
    super.key,
  });

  final IconData icon;
  final Color tint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(KpSpacing.s),
          decoration: BoxDecoration(
            color: tint.withValues(alpha: 0.15),
            borderRadius: KpRadii.allM,
          ),
          child: Icon(icon, color: tint),
        ),
        const Gap.s(horizontal: true),
        Text(title, style: context.textTheme.headlineMedium),
      ],
    );
  }
}

/// A row-chunked grid of [TabletPocketCard]s. Each row is an [IntrinsicHeight]
/// so all cells — including the dashed "Start New Group" card — share the
/// tallest card's height.
class PocketsGrid extends StatelessWidget {
  const PocketsGrid({
    required this.pockets,
    required this.organiser,
    this.onOpenPocket,
    this.onCreate,
    super.key,
  });

  static const int _columns = 3;

  final List<Pocket> pockets;
  final bool organiser;
  final ValueChanged<String>? onOpenPocket;
  final VoidCallback? onCreate;

  @override
  Widget build(BuildContext context) {
    final cells = <Widget>[
      for (final pocket in pockets)
        TabletPocketCard(
          pocket: pocket,
          organiser: organiser,
          onTap: () => onOpenPocket?.call(pocket.id),
        ),
      if (onCreate != null) StartNewGroupCard(onTap: onCreate!),
    ];

    final rows = <List<Widget>>[
      for (var i = 0; i < cells.length; i += _columns)
        cells.sublist(i, (i + _columns).clamp(0, cells.length)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var r = 0; r < rows.length; r++) ...[
          if (r > 0) const Gap.l(),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var c = 0; c < _columns; c++) ...[
                  if (c > 0) const Gap.l(horizontal: true),
                  Expanded(
                    child: c < rows[r].length
                        ? rows[r][c]
                        : const SizedBox.shrink(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}

/// The celebratory "great job" reward card at the foot of the tablet view.
class PocketsRewardCard extends StatelessWidget {
  const PocketsRewardCard({required this.name, super.key});

  static const double _btnWidth = 180;

  final String name;

  @override
  Widget build(BuildContext context) {
    final onTip = context.colorScheme.onPrimaryContainer;
    return Container(
      padding: const EdgeInsets.all(KpSpacing.l),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: KpRadii.allXl,
      ),
      child: Row(
        children: [
          const KpMascot.celebrate(size: 140),
          const Gap.l(horizontal: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.pocketsTipTitle(name),
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: onTip,
                  ),
                ),
                const Gap.xs(),
                Text(
                  context.l10n.pocketsTipBody,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: onTip,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap.m(),
                Row(
                  children: [
                    SizedBox(
                      width: _btnWidth,
                      child: KpButton(
                        label: context.l10n.pocketsViewHistory,
                        onPressed: () {},
                      ),
                    ),
                    const Gap.s(horizontal: true),
                    SizedBox(
                      width: _btnWidth,
                      child: KpButton(
                        label: context.l10n.pocketsPocketStats,
                        variant: KpButtonVariant.secondary,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
