import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_cubit.dart';
import 'package:keenpockets/features/administration/presentation/cubit/admin_state.dart';

/// Super-admin console + collection-health KPIs. Role-gated: non-super-admins
/// see the permission-denied state.
class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminCubit>(
      create: (_) => getIt<AdminCubit>()..load(),
      child: const _AdminView(),
    );
  }
}

class _AdminView extends StatelessWidget {
  const _AdminView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.adminTitle)),
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            permissionDenied: KpErrorView(
              message: context.l10n.adminPermissionDenied,
              icon: Icons.lock_outline,
            ),
            loaded: (context) {
              final d = state.data;
              if (d == null) return const SizedBox.shrink();
              return ListView(
                padding: const EdgeInsets.all(KpSpacing.l),
                children: [
                  _Stat(
                    label: context.l10n.adminHealthScore,
                    value: '${d.healthScore}%',
                  ),
                  _Stat(
                    label: context.l10n.adminActiveAdmins,
                    value: '${d.activeAdmins}',
                  ),
                  _Stat(
                    label: context.l10n.adminKeensInCirculation,
                    value: '${d.keensInCirculation}',
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

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: KpSpacing.s),
      child: Row(
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
      ),
    );
  }
}
