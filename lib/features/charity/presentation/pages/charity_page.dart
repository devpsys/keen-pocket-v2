import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:keenpockets/app/app_nav.dart';
import 'package:keenpockets/core/di/injection.dart';
import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/core/widgets/kp_network_image.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_cubit.dart';
import 'package:keenpockets/features/charity/presentation/cubit/charity_state.dart';
import 'package:keenpockets/features/charity/presentation/view_models/charity_view.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_donate_card.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_donate_tablet_widgets.dart';
import 'package:keenpockets/features/charity/presentation/widgets/charity_fixtures.dart';

/// Charity drive donation screen (design `charity_donate_card` / `_tablet`):
/// goal progress, resource pledges, anonymised donors and a Mr K nudge.
class CharityPage extends StatelessWidget {
  const CharityPage({required this.pocketId, super.key});

  final String pocketId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharityCubit>(
      create: (_) => getIt<CharityCubit>()..load(pocketId),
      child: const _CharityView(),
    );
  }
}

class _CharityView extends StatelessWidget {
  const _CharityView();

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: context.colorScheme.primary),
      shape: Border(
        bottom: BorderSide(
          color: context.colorScheme.surfaceContainerHighest,
          width: 4,
        ),
      ),
      title: Text(
        context.l10n.charityDonateTitle,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: KpSpacing.m),
          child: Center(
            child: KpNetworkAvatar(url: kCharityAvatarUrl, radius: KpSpacing.m),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharityCubit, CharityState>(
      builder: (context, state) {
        final body = KpAsyncView(
          status: state.status,
          loaded: (context) {
            final d = state.drive;
            if (d == null) return const SizedBox.shrink();
            return context.isExpanded
                ? _tablet(context, d)
                : _phone(context, d);
          },
        );
        if (context.isExpanded) {
          return AppTabletShell(
            selectedIndex: kPocketsTabIndex,
            body: Scaffold(
              appBar: _appBar(context),
              body: SafeArea(child: body),
            ),
          );
        }
        return Scaffold(
          appBar: _appBar(context),
          body: SafeArea(child: body),
        );
      },
    );
  }

  Widget _phone(BuildContext context, CharityView d) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.l),
      children: [
        const Gap.m(),
        CharityHero(title: d.title),
        const Gap.xl(),
        CharityFinancialCard(drive: d, onDonate: (_) {}),
        const Gap.l(),
        const CharityResourceCard(items: kCharityResources),
        const Gap.l(),
        CharityContributionsCard(contributions: kCharityContributions),
        const Gap.l(),
        const CharityMascotTip(),
      ],
    );
  }

  Widget _tablet(BuildContext context, CharityView d) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(KpSpacing.l),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CharityDonateHeroTablet(
                  drive: d,
                  resources: kCharityResourcesTablet,
                ),
                const Gap.m(),
                const CharityMascotFeedback(),
              ],
            ),
          ),
          const Gap.m(horizontal: true),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CharityContributionPanel(onDonate: (_) {}),
                const Gap.m(),
                CharityRecentHeroes(heroes: kCharityHeroes),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
