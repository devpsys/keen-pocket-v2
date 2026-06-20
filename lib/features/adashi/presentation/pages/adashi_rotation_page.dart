import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_rotation_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_rotation_state.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_rotation_tablet_widgets.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_rotation_widgets.dart';
import 'package:keenpockets/features/group_collaboration/group_collaboration.dart';

/// Rotation screen for one circle (design `adashi_rotation`): the pot gauge, a
/// Mr K tip, the cycle rotation order, and the members list. Phone-first; on
/// wider screens it centres within a readable column.
class AdashiRotationPage extends StatelessWidget {
  const AdashiRotationPage({required this.adashiId, super.key});

  static const double _maxWidth = 640;

  final String adashiId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdashiRotationCubit>(
      create: (_) => getIt<AdashiRotationCubit>()..load(adashiId),
      child: _AdashiRotationView(adashiId: adashiId),
    );
  }
}

class _AdashiRotationView extends StatelessWidget {
  const _AdashiRotationView({required this.adashiId});

  final String adashiId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdashiRotationCubit, AdashiRotationState>(
      builder: (context, state) {
        final rotation = state.rotation;
        final scaffold = Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(color: context.colorScheme.primary),
            shape: Border(
              bottom: BorderSide(
                color: context.colorScheme.surfaceContainerHighest,
                width: 2,
              ),
            ),
            title: Text(
              rotation == null
                  ? context.l10n.adashiTitle
                  : context.l10n.adashiRotationScreenTitle(rotation.groupName),
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              if (rotation != null)
                Padding(
                  padding: const EdgeInsets.only(right: KpSpacing.m),
                  child: Container(
                    width: KpSpacing.xl,
                    height: KpSpacing.xl,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.colorScheme.primaryContainer,
                        width: 2,
                      ),
                    ),
                    child: KpNetworkAvatar(url: rotation.avatarUrl, radius: 14),
                  ),
                ),
            ],
          ),
          floatingActionButton: rotation == null || context.isExpanded
              ? null
              : GroupChatFab(groupId: adashiId),
          body: KpAsyncView(
            status: state.status,
            empty: KpEmptyView(
              title: context.l10n.adashiEmptyTitle,
              message: context.l10n.adashiEmptyMessage,
            ),
            loaded: (context) => rotation == null
                ? const SizedBox.shrink()
                : context.isExpanded
                ? _tabletBody(context, rotation)
                : _body(context, rotation),
          ),
        );

        // Tablet keeps the screen inside the persistent side-rail shell.
        if (context.isExpanded) {
          return AppTabletShell(selectedIndex: kAdashiTabIndex, body: scaffold);
        }
        return scaffold;
      },
    );
  }

  // Tablet console (design `adashi_rotation_tablet`): an 8/4 split — pot/target,
  // rotation order + actions on the left; Mr K tip + members on the right.
  Widget _tabletBody(BuildContext context, AdashiRotationView rotation) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: ListView(
          padding: const EdgeInsets.all(KpSpacing.xl),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RotationTabletTarget(rotation: rotation),
                      const Gap.l(),
                      RotationTabletOrder(cycles: rotation.cycles),
                      const Gap.l(),
                      RotationTabletActions(adashiId: adashiId),
                    ],
                  ),
                ),
                const Gap.l(horizontal: true),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RotationTabletTip(tip: rotation.tip),
                      const Gap.l(),
                      RotationTabletMembers(members: rotation.members),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, AdashiRotationView rotation) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AdashiRotationPage._maxWidth,
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            KpSpacing.m,
            KpSpacing.l,
            KpSpacing.m,
            KpSpacing.xxxl + KpSpacing.m,
          ),
          children: [
            AdashiRotationPot(rotation: rotation),
            const Gap.xl(),
            AdashiMrKTip(tip: rotation.tip),
            const Gap.xl(),
            AdashiRotationOrder(cycles: rotation.cycles),
            const Gap.xl(),
            AdashiRotationMembers(members: rotation.members),
          ],
        ),
      ),
    );
  }
}
