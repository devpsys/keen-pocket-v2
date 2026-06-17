import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:keenpockets/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/phone_dashboard.dart';
import 'package:keenpockets/features/dashboard/presentation/widgets/tablet_dashboard.dart';

/// At-a-glance savings cockpit: greeting, key stats, weekly goal, featured
/// pockets/adashi (design phase C — `home_dashboard`).
class DashboardPage extends StatelessWidget {
  const DashboardPage({
    this.onOpenPocket,
    this.onOpenAdashi,
    this.onOpenWallet,
    super.key,
  });

  final ValueChanged<String>? onOpenPocket;
  final ValueChanged<String>? onOpenAdashi;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (_) => getIt<DashboardCubit>()..load(),
      child: _DashboardView(
        onOpenPocket: onOpenPocket,
        onOpenAdashi: onOpenAdashi,
        onOpenWallet: onOpenWallet,
      ),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({
    this.onOpenPocket,
    this.onOpenAdashi,
    this.onOpenWallet,
  });

  final ValueChanged<String>? onOpenPocket;
  final ValueChanged<String>? onOpenAdashi;
  final VoidCallback? onOpenWallet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return KpAsyncView(
            status: state.status,
            loaded: (context) {
              final d = state.data;
              if (d == null) return const SizedBox.shrink();
              return context.isExpanded
                  ? TabletDashboard(
                      data: d,
                      onOpenPocket: onOpenPocket,
                      onOpenAdashi: onOpenAdashi,
                      onOpenWallet: onOpenWallet,
                    )
                  : PhoneDashboard(
                      data: d,
                      onOpenPocket: onOpenPocket,
                      onOpenAdashi: onOpenAdashi,
                      onOpenWallet: onOpenWallet,
                    );
            },
          );
        },
      ),
    );
  }
}
