import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_detail_state.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_hub_app_bar.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_hub_tablet_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_hub_view.dart';
import 'package:keenpockets/features/group_collaboration/group_collaboration.dart';

/// The Adashi hub for one circle (design `adashi_hub` / `adashi_hub_tablet`):
/// admin header, current cycle, rotation timeline, payout, history, disputes.
class AdashiDetailPage extends StatelessWidget {
  const AdashiDetailPage({required this.adashiId, super.key});

  final String adashiId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdashiDetailCubit>(
      create: (_) => getIt<AdashiDetailCubit>()..load(adashiId),
      child: _AdashiDetailView(adashiId: adashiId),
    );
  }
}

class _AdashiDetailView extends StatelessWidget {
  const _AdashiDetailView({required this.adashiId});

  final String adashiId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdashiDetailCubit, AdashiDetailState>(
      builder: (context, state) {
        final adashi = state.adashi;

        final content = KpAsyncView(
          status: state.status,
          empty: KpEmptyView(
            title: context.l10n.adashiEmptyTitle,
            message: context.l10n.adashiEmptyMessage,
          ),
          loaded: (context) => adashi == null
              ? const SizedBox.shrink()
              : context.isExpanded
              ? AdashiHubTabletView(detail: adashi)
              : AdashiHubView(detail: adashi),
        );

        // Tablet: the cockpit lives inside the persistent side-rail shell and
        // carries its own "Adashi Hub" header (design `adashi_hub_tablet`).
        if (context.isExpanded) {
          return AppTabletShell(
            selectedIndex: kAdashiTabIndex,
            body: Scaffold(body: content),
          );
        }

        // Phone: branded app bar + chat FAB (design `adashi_hub`).
        return Scaffold(
          appBar: adashi == null
              ? AppBar(
                  scrolledUnderElevation: 0,
                  title: Text(context.l10n.adashiHubTitle),
                )
              : AdashiHubAppBar(avatarUrl: adashi.adminAvatarUrl),
          floatingActionButton: adashi == null
              ? null
              : GroupChatFab(groupId: adashiId),
          body: content,
        );
      },
    );
  }
}
