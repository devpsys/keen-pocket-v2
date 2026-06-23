import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_cubit.dart';
import 'package:keenpockets/features/trust/presentation/cubit/trust_state.dart';
import 'package:keenpockets/features/trust/presentation/pages/vouches_inbox_page.dart';
import 'package:keenpockets/features/trust/presentation/view_models/trust_view.dart';
import 'package:keenpockets/features/trust/presentation/widgets/reputation_block.dart';
import 'package:keenpockets/features/trust/presentation/widgets/trust_fixtures.dart';
import 'package:keenpockets/features/trust/presentation/widgets/trust_hub_tablet.dart';

/// Reputation profile (design `reputation_trust_score`): the trust-score hero,
/// headline stats, recent ratings and the vouch / invite actions.
class TrustPage extends StatelessWidget {
  const TrustPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrustCubit>(
      create: (_) => getIt<TrustCubit>()..load(),
      child: const _TrustView(),
    );
  }
}

class _TrustView extends StatelessWidget {
  const _TrustView();

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          const Gap.m(horizontal: true),
          const KpNetworkAvatar(url: kTrustAvatarUrl, radius: KpSpacing.m),
          const Gap.s(horizontal: true),
          Text(
            context.l10n.brandWordmark,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: context.l10n.vouchTitle,
          onPressed: () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (_) => const VouchesInboxPage()),
          ),
          icon: Icon(
            Icons.how_to_reg_rounded,
            color: context.colorScheme.primary,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            KpIcons.notificationsOutlined,
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrustCubit, TrustState>(
      builder: (context, state) {
        final body = KpAsyncView(
          status: state.status,
          loaded: (context) {
            final t = state.trust;
            if (t == null) return const SizedBox.shrink();
            return context.isExpanded
                ? _tablet(context, t)
                : _phone(context, t);
          },
        );
        if (context.isExpanded) {
          return AppTabletShell(
            selectedIndex: kPocketsTabIndex,
            body: Scaffold(body: SafeArea(child: body)),
          );
        }
        return Scaffold(
          appBar: _appBar(context),
          body: SafeArea(child: body),
        );
      },
    );
  }

  Widget _phone(BuildContext context, TrustView t) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        ReputationBlock(trust: t),
        const Gap.xl(),
        _actions(context, t),
      ],
    );
  }

  Widget _tablet(BuildContext context, TrustView t) => TrustHubTablet(trust: t);

  Widget _actions(BuildContext context, TrustView t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KpButton(
          label: context.l10n.trustVouchFor(t.memberName ?? '').toUpperCase(),
          onPressed: () {},
        ),
        const Gap.s(),
        KpButton(
          label: context.l10n.trustInviteToPocket.toUpperCase(),
          variant: KpButtonVariant.neutral,
          onPressed: () {},
        ),
      ],
    );
  }
}
