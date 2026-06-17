import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/group_collaboration.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_state.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_contributions_section.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_fixtures.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_layout.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_group_rules_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_header_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_members_section.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_payout_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_pending_approvals.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_progress_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_shopping_section.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_top_contributors_card.dart';

/// The pocket detail hub (design phase D — `pocket_detail_hub`). Assembles the
/// owning feature's page from cross-feature composables (map §3).
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.pocketsTitle)),
      floatingActionButton: BlocBuilder<PocketDetailCubit, PocketDetailState>(
        builder: (context, state) {
          final pocket = state.pocket;
          if (pocket == null) return const SizedBox.shrink();
          return GroupChatFab(groupId: pocket.id, unreadCount: 3);
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

              // Compose the hub from feature-private + cross-feature sections,
              // then reflow them into a tablet or phone layout.
              final header = PocketHeaderCard(pocket: pocket, role: state.role);
              final progress = PocketProgressCard(pocket: pocket);
              final contributions = PocketContributionsSection(
                pocket: pocket,
                role: state.role,
              );
              const shopping = PocketShoppingSection(
                items: kPocketShoppingItems,
                estimatedTotal: Money(4500000),
              );
              const pending = PocketPendingApprovals();
              const payout = PocketPayoutCard();
              const members = PocketMembersSection();
              const top = PocketTopContributorsCard();
              const rules = PocketGroupRulesCard();

              return context.isExpanded
                  ? PocketDetailTabletLayout(
                      header: header,
                      progress: progress,
                      contributions: contributions,
                      shopping: shopping,
                      pending: pending,
                      payout: payout,
                      members: members,
                      topContributors: top,
                      rules: rules,
                    )
                  : PocketDetailPhoneLayout(
                      header: header,
                      progress: progress,
                      contributions: contributions,
                      shopping: shopping,
                      pending: pending,
                      payout: payout,
                      members: members,
                      topContributors: top,
                      rules: rules,
                    );
            },
          );
        },
      ),
    );
  }
}
