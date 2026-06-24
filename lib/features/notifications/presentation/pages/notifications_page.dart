import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:keenpockets/features/notifications/presentation/notifications_fixtures.dart';
import 'package:keenpockets/features/notifications/presentation/widgets/notifications_tablet_widgets.dart';
import 'package:keenpockets/features/notifications/presentation/widgets/notifications_widgets.dart';

/// Notifications inbox (designs `notifications_inbox` / `_tablet`): a candy list
/// with All/Unread filters on phone and a master-detail layout on tablet.
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      create: (_) => getIt<NotificationsCubit>()..load(),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final cubit = context.read<NotificationsCubit>();

        if (context.isExpanded) {
          return AppTabletShell(
            body: Scaffold(
              appBar: _appBar(context, title: context.l10n.notificationsTitle),
              body: KpAsyncView(
                status: state.status,
                loaded: (context) => NotificationsInboxTabletView(
                  state: state,
                  onFilter: cubit.setFilter,
                  onSelect: cubit.select,
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: _appBar(context, title: context.l10n.brandWordmark),
          body: KpAsyncView(
            status: state.status,
            loaded: (context) => NotificationsInboxView(
              state: state,
              onMarkAllRead: cubit.markAllRead,
              onFilter: cubit.setFilter,
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _appBar(BuildContext context, {required String title}) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        title,
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
                url: kNotificationsUserAvatar,
                radius: KpSpacing.s,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
