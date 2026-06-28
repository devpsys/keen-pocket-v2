import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/feature_flags/feature.dart';
import 'package:keenpockets/core/feature_flags/feature_flag_service.dart';
import 'package:keenpockets/core/feature_flags/feature_guard.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_cubit.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_state.dart';
import 'package:keenpockets/features/money/presentation/widgets/payouts_tablet_widgets.dart';
import 'package:keenpockets/features/money/presentation/widgets/payouts_widgets.dart';

/// Payouts & bank hub (designs `payouts_bank_hub` / `_tablet`). Flag-gated:
/// when `PAYOUTS_ENABLED` is off (the default) the coming-soon card shows.
class PayoutsHubPage extends StatelessWidget {
  const PayoutsHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = getIt<FeatureFlagService>().isEnabled(Feature.payouts);
    final gated = FeatureGuard(
      enabled: enabled,
      comingSoon: KpComingSoonCard(
        title: context.l10n.comingSoonTitle,
        message: context.l10n.comingSoonMessage,
      ),
      child: BlocProvider<PayoutsCubit>(
        create: (_) => getIt<PayoutsCubit>()..load(),
        child: const _PayoutsView(),
      ),
    );

    if (context.isExpanded) {
      return AppTabletShell(
        body: Scaffold(
          appBar: _appBar(context, title: context.l10n.payoutsTitle),
          body: gated,
        ),
      );
    }
    return Scaffold(
      appBar: _appBar(
        context,
        title: context.l10n.payoutsTitle,
        showBack: true,
      ),
      body: gated,
    );
  }

  PreferredSizeWidget _appBar(
    BuildContext context, {
    required String title,
    bool showBack = false,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading: showBack
          ? IconButton(
              onPressed: () => Navigator.of(context).maybePop(),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: context.colorScheme.primary,
              ),
            )
          : null,
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
    );
  }
}

class _PayoutsView extends StatelessWidget {
  const _PayoutsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayoutsCubit, PayoutsState>(
      builder: (context, state) {
        return KpAsyncView(
          status: state.status,
          loaded: (context) => context.isExpanded
              ? PayoutsTabletView(state: state)
              : PayoutsPhoneView(state: state, onEdit: (_) {}),
        );
      },
    );
  }
}
