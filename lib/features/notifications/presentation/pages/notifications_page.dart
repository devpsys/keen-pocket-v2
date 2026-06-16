import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:keenpockets/features/notifications/presentation/cubit/notifications_state.dart';

/// Notifications inbox with read/unread styling and a mark-all-read action.
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
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.notificationsTitle),
        actions: [
          TextButton(
            onPressed: () => context.read<NotificationsCubit>().markAllRead(),
            child: Text(context.l10n.notificationsMarkAllRead),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            empty: KpEmptyView(
              title: context.l10n.notificationsEmptyTitle,
              message: context.l10n.notificationsEmptyMessage,
            ),
            loaded: (context) => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final n = state.items[index];
                return ListTile(
                  leading: Icon(
                    n.isRead
                        ? Icons.notifications_none
                        : Icons.notifications_active,
                    color: n.isRead
                        ? context.colorScheme.onSurfaceVariant
                        : context.colorScheme.primary,
                  ),
                  title: Text(
                    n.title,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: n.isRead ? FontWeight.w400 : FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(n.body),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
