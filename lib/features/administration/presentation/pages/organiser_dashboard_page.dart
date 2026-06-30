import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/administration/presentation/cubit/organiser_cubit.dart';
import 'package:keenpockets/features/administration/presentation/cubit/organiser_state.dart';
import 'package:keenpockets/features/administration/presentation/widgets/organiser_tablet_widgets.dart';
import 'package:keenpockets/features/administration/presentation/widgets/organiser_widgets.dart';

/// Organiser dashboard — managed-pocket health KPIs and a pulse checklist
/// (design `admin_health_dashboard`). Presentation-only.
class OrganiserDashboardPage extends StatelessWidget {
  const OrganiserDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final page = Scaffold(
      appBar: _appBar(context),
      body: BlocProvider<OrganiserCubit>(
        create: (_) => getIt<OrganiserCubit>()..load(),
        child: const _OrganiserView(),
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
        context.l10n.organiserTitle,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}

class _OrganiserView extends StatelessWidget {
  const _OrganiserView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganiserCubit, OrganiserState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) {
            final organiser = state.data;
            if (organiser == null) return const SizedBox.shrink();
            return context.isExpanded
                ? OrganiserDashboardTabletView(organiser: organiser)
                : OrganiserDashboardView(organiser: organiser);
          },
        );
      },
    );
  }
}
