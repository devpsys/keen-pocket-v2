import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_cubit.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_state.dart';
import 'package:keenpockets/features/administration/presentation/pages/organiser_dashboard_page.dart';
import 'package:keenpockets/features/administration/presentation/widgets/admin_tablet_widgets.dart';
import 'package:keenpockets/features/administration/presentation/widgets/admin_widgets.dart';

/// Super-admin console (design `super_admin_console`). Role-gated: non-super-admins
/// see the permission-denied state; no privileged data is ever loaded for them.
class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final page = Scaffold(
      appBar: _appBar(context),
      body: BlocProvider<AdminCubit>(
        create: (_) => getIt<AdminCubit>()..load(),
        child: const _AdminView(),
      ),
    );
    return context.isExpanded ? AppTabletShell(body: page) : page;
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        context.l10n.adminTitle,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          tooltip: context.l10n.organiserTitle,
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (_) => const OrganiserDashboardPage()),
          ),
          icon: Icon(
            Icons.monitor_heart_rounded,
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _AdminView extends StatelessWidget {
  const _AdminView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          permissionDenied: KpErrorView(
            message: context.l10n.adminPermissionDenied,
            icon: Icons.lock_outline,
          ),
          loaded: (context) {
            final admin = state.data;
            if (admin == null) return const SizedBox.shrink();
            return context.isExpanded
                ? AdminConsoleTabletView(admin: admin)
                : AdminConsoleView(admin: admin);
          },
        );
      },
    );
  }
}
