import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/error/failure_localizer.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/group_collaboration/group_collaboration.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_cubit.dart';
import 'package:keenpockets/features/pockets/presentation/cubit/pocket_detail_state.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_phone_view.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_detail_tablet_view.dart';

/// The pocket detail hub (design `pocket_detail_hub` / `pocket_detail_hub_tablet`).
/// Assembles the owning feature's page from composable section widgets.
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
    return AppTabletShell(
      body: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            context.isExpanded
                ? context.l10n.pocketDetailTitle
                : context.l10n.brandWordmark,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(KpIcons.notificationsOutlined),
            ),
          ],
        ),
        floatingActionButton: BlocBuilder<PocketDetailCubit, PocketDetailState>(
          builder: (context, state) {
            final pocket = state.pocket;
            if (pocket == null) return const SizedBox.shrink();
            return GroupChatFab(groupId: pocket.id, unreadCount: 3);
          },
        ),
        body: BlocBuilder<PocketDetailCubit, PocketDetailState>(
          builder: (context, state) {
            return KpAsyncView(
              status: state.status,
              failure: KpErrorView(
                message:
                    state.failure?.localizedMessage(context) ??
                    context.l10n.errorGeneric,
                retryLabel: context.l10n.retry,
                onRetry: () =>
                    context.read<PocketDetailCubit>().load(state.pocket!.id),
              ),
              loaded: (context) {
                final pocket = state.pocket;
                // Guard the brief `initial` frame so the page never flashes empty.
                if (pocket == null) return const KpLoadingView();
                return context.isExpanded
                    ? PocketDetailTabletView(pocket: pocket, role: state.role)
                    : PocketDetailPhoneView(pocket: pocket, role: state.role);
              },
            );
          },
        ),
      ),
    );
  }
}
