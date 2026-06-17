import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pockets_state.dart';
import 'package:keenpockets/features/pockets/presentation/pages/create_pocket_page.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_card.dart';

/// The Pockets tab: lists the current user's pockets with the universal states.
class PocketsPage extends StatelessWidget {
  const PocketsPage({this.onOpenPocket, super.key});

  /// Navigates to a pocket's detail (wired by the router).
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PocketsCubit>(
      create: (_) => getIt<PocketsCubit>()..load(),
      child: _PocketsView(onOpenPocket: onOpenPocket),
    );
  }
}

class _PocketsView extends StatelessWidget {
  const _PocketsView({this.onOpenPocket});

  final ValueChanged<String>? onOpenPocket;

  void _create(BuildContext context) {
    Navigator.of(
      context,
    ).push<void>(MaterialPageRoute(builder: (_) => const CreatePocketPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.pocketsMyTitle),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: BlocBuilder<PocketsCubit, PocketsState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            empty: _PocketsList(
              pockets: const [],
              onOpenPocket: onOpenPocket,
              onCreate: () => _create(context),
            ),
            failure: KpErrorView(
              message:
                  state.failure?.localizedMessage(context) ??
                  context.l10n.errorGeneric,
              retryLabel: context.l10n.retry,
              onRetry: () => context.read<PocketsCubit>().load(),
            ),
            loaded: (context) => RefreshIndicator(
              onRefresh: () => context.read<PocketsCubit>().load(),
              child: _PocketsList(
                pockets: state.pockets,
                onOpenPocket: onOpenPocket,
                onCreate: () => _create(context),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PocketsList extends StatelessWidget {
  const _PocketsList({
    required this.pockets,
    required this.onCreate,
    this.onOpenPocket,
  });

  final List<Pocket> pockets;
  final VoidCallback onCreate;
  final ValueChanged<String>? onOpenPocket;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.m),
      children: [
        const _MrKTip(),
        const Gap.m(),
        for (final pocket in pockets) ...[
          PocketCard(
            pocket: pocket,
            onTap: () => onOpenPocket?.call(pocket.id),
          ),
          const Gap.s(),
        ],
        const Gap.xs(),
        _CreateCard(onTap: onCreate),
        const Gap.l(),
        KpButton(
          label: context.l10n.pocketBrowsePublic,
          icon: Icons.explore_rounded,
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

class _MrKTip extends StatelessWidget {
  const _MrKTip();

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

class _CreateCard extends StatelessWidget {
  const _CreateCard({required this.onTap});

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
              Icons.add_rounded,
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
