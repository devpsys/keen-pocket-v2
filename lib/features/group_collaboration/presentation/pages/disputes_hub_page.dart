import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/disputes_hub_cubit.dart';
import 'package:keenpockets/features/group_collaboration/presentation/cubit/disputes_hub_state.dart';
import 'package:keenpockets/features/group_collaboration/presentation/disputes_fixtures.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/disputes_hub_tablet_widgets.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/disputes_hub_widgets.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/raise_dispute_sheet.dart';

/// Disputes hub for a pocket/adashi (designs `disputes_hub` /
/// `disputes_hub_tablet`): summary stats, case list and resolutions, with an
/// admin view on phone and a master-detail layout on tablet. Presentation-only.
class DisputesHubPage extends StatelessWidget {
  const DisputesHubPage({required this.groupId, super.key});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DisputesHubCubit>(
      create: (_) => getIt<DisputesHubCubit>()..load(groupId),
      child: const _DisputesHubView(),
    );
  }
}

class _DisputesHubView extends StatelessWidget {
  const _DisputesHubView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisputesHubCubit, DisputesHubState>(
      builder: (context, state) {
        final cubit = context.read<DisputesHubCubit>();

        if (context.isExpanded) {
          return AppTabletShell(
            selectedIndex: kAdashiTabIndex,
            body: Scaffold(
              body: KpAsyncView(
                status: state.status,
                loaded: (context) => DisputesHubTabletView(
                  disputes: state.disputes,
                  selectedId: state.selectedId,
                  onSelect: cubit.select,
                  onRaise: () => RaiseDisputeSheet.show(context),
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            // Candy bottom border, matching the design's app-bar shadow.
            shape: Border(
              bottom: BorderSide(
                color: context.colorScheme.surfaceContainerHighest,
                width: 4,
              ),
            ),
            title: Text(
              context.l10n.brandWordmark,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  KpIcons.notificationsOutlined,
                  color: context.colorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: KpSpacing.m),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(KpSpacing.xxs),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.colorScheme.primaryContainer,
                        width: 2,
                      ),
                    ),
                    child: const KpNetworkAvatar(
                      url: kDisputesUserAvatar,
                      radius: KpSpacing.s,
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => RaiseDisputeSheet.show(context),
            icon: const Icon(Icons.gavel_rounded),
            label: Text(context.l10n.disputesRaise),
          ),
          body: KpAsyncView(
            status: state.status,
            loaded: (context) => DisputesHubView(
              disputes: state.disputes,
              adminView: state.adminView,
              resolvedThisMonth: state.resolvedThisMonth,
              avgResolution: state.avgResolution,
              onToggleAdmin: (_) => cubit.toggleAdminView(),
            ),
          ),
        );
      },
    );
  }
}
