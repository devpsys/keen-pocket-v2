import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/contributions/contributions.dart';
import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_state.dart';

/// Detail view for a single pocket, including the current user's role badge.
class PocketDetailPage extends StatelessWidget {
  const PocketDetailPage({required this.pocketId, super.key});

  final String pocketId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PocketDetailCubit>(
      create: (_) => getIt<PocketDetailCubit>()..load(pocketId),
      child: const _PocketDetailView(),
    );
  }
}

class _PocketDetailView extends StatelessWidget {
  const _PocketDetailView();

  String _roleLabel(BuildContext context, PocketRole role) => switch (role) {
    PocketRole.organiser => context.l10n.roleOrganiser,
    PocketRole.member => context.l10n.roleMember,
    PocketRole.guest => context.l10n.roleGuest,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.pocketsTitle)),
      floatingActionButton: BlocBuilder<PocketDetailCubit, PocketDetailState>(
        builder: (context, state) {
          final pocket = state.pocket;
          if (pocket == null) return const SizedBox.shrink();
          return FloatingActionButton.extended(
            icon: const Icon(Icons.receipt_long_outlined),
            label: Text(context.l10n.contributionsTitle),
            onPressed: () => Navigator.of(context).push<void>(
              MaterialPageRoute(
                builder: (_) => InvoiceHistoryPage(
                  context: ContributionContext.pocket(pocket.id),
                  canVerify: state.role == PocketRole.organiser,
                ),
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<PocketDetailCubit, PocketDetailState>(
        builder: (context, state) {
          final pocket = state.pocket;
          return KpAsyncView(
            status: state.status,
            failure: KpErrorView(
              message:
                  state.failure?.localizedMessage(context) ??
                  context.l10n.errorGeneric,
              retryLabel: context.l10n.retry,
            ),
            loaded: (context) {
              if (pocket == null) return const SizedBox.shrink();
              return ListView(
                padding: const EdgeInsets.all(KpSpacing.l),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          pocket.name,
                          style: context.textTheme.headlineMedium,
                        ),
                      ),
                      Chip(label: Text(_roleLabel(context, state.role))),
                    ],
                  ),
                  const Gap.l(),
                  _StatRow(
                    label: context.l10n.pocketHandPrice,
                    value: pocket.handPrice.format(),
                  ),
                  const Gap.s(),
                  _StatRow(
                    label: context.l10n.pocketsTitle,
                    value: context.l10n.pocketHandsFilled(
                      pocket.filledHands,
                      pocket.totalHands,
                    ),
                  ),
                  const Gap.s(),
                  _StatRow(
                    label: context.l10n.profileTitle,
                    value: context.l10n.pocketMembersCount(pocket.memberCount),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(value, style: context.textTheme.titleMedium),
      ],
    );
  }
}
