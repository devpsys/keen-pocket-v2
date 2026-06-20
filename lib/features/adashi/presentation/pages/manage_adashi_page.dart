import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_manage_cubit.dart';
import 'package:keenpockets/features/adashi/presentation/cubit/adashi_manage_state.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_manage_tablet_widgets.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_manage_widgets.dart';

/// Organiser "manage circle" screen (design `manage_adashi` / `_tablet`):
/// members, add-member, payment verification, reconcile, admin overrides, and
/// circle settings. Presentation-only.
class ManageAdashiPage extends StatefulWidget {
  const ManageAdashiPage({required this.adashiId, super.key});

  final String adashiId;

  @override
  State<ManageAdashiPage> createState() => _ManageAdashiPageState();
}

class _ManageAdashiPageState extends State<ManageAdashiPage> {
  bool _publicVisibility = false;
  bool _showPayoutNames = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdashiManageCubit>(
      create: (_) => getIt<AdashiManageCubit>()..load(widget.adashiId),
      child: BlocBuilder<AdashiManageCubit, AdashiManageState>(
        builder: (context, state) {
          final manage = state.manage;
          final content = KpAsyncView(
            status: state.status,
            empty: KpEmptyView(
              title: context.l10n.adashiEmptyTitle,
              message: context.l10n.adashiEmptyMessage,
            ),
            loaded: (context) => manage == null
                ? const SizedBox.shrink()
                : context.isExpanded
                ? _tablet(context, manage)
                : _phone(context, manage),
          );

          if (context.isExpanded) {
            return AppTabletShell(
              selectedIndex: kAdashiTabIndex,
              body: Scaffold(body: content),
            );
          }
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              title: Text(
                context.l10n.adashiManageTitle,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            ),
            body: content,
          );
        },
      ),
    );
  }

  AdashiManageToggles _toggles() => AdashiManageToggles(
    publicVisibility: _publicVisibility,
    onPublicVisibility: (v) => setState(() => _publicVisibility = v),
    showPayoutNames: _showPayoutNames,
    onShowPayoutNames: (v) => setState(() => _showPayoutNames = v),
  );

  Widget _phone(BuildContext context, AdashiManageView manage) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxxl,
      ),
      children: [
        AdashiMembersTable(
          memberCount: manage.memberCount,
          members: manage.members,
        ),
        const Gap.xl(),
        const AdashiAddMemberCard(),
        const Gap.xl(),
        AdashiVerifyPayments(pending: manage.pending),
        const Gap.xl(),
        AdashiReconcileButton(nextPosition: manage.nextPosition),
        const Gap.xl(),
        const AdashiAdminOverrides(),
        const Gap.xl(),
        _toggles(),
        const Gap.xl(),
        const AdashiManageMascot(),
      ],
    );
  }

  // Admin console (design `manage_adashi_tablet`): a header, a 5/7 roster +
  // workspace grid, a fixed export/rotation footer, and a floating Mr K.
  Widget _tablet(BuildContext context, AdashiManageView manage) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(KpSpacing.xl),
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _TabletHeader(groupName: manage.groupName),
                          const Gap.xl(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ManageTabletMembers(manage: manage),
                                    const Gap.l(),
                                    ManageTabletAddMember(
                                      nextSlot: manage.nextAvailableSlot,
                                    ),
                                  ],
                                ),
                              ),
                              const Gap.l(horizontal: true),
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ManageTabletVerify(pending: manage.pending),
                                    const Gap.l(),
                                    const ManageTabletOverrides(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Gap.xl(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Positioned(
                right: KpSpacing.xl,
                bottom: KpSpacing.m,
                child: _FloatingMascot(),
              ),
            ],
          ),
        ),
        ManageTabletFooter(
          currentSlot: manage.currentSlot,
          totalSlots: manage.totalSlots,
        ),
      ],
    );
  }
}

/// Tablet header console: title + circle subtitle with notification/help icons.
class _TabletHeader extends StatelessWidget {
  const _TabletHeader({required this.groupName});

  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.adashiManageTitle,
                style: context.textTheme.headlineMedium?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap.xxs(),
              Text(
                context.l10n.adashiManageCircleSubtitle(groupName),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.help_outline_rounded,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

/// Floating Mr K cheering in the corner of the console.
class _FloatingMascot extends StatelessWidget {
  const _FloatingMascot();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KpSpacing.s),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.primaryContainer,
        border: const Border(
          bottom: BorderSide(color: KpColors.brand600, width: 6),
        ),
      ),
      child: const KpMascot.celebrate(size: 72),
    );
  }
}
