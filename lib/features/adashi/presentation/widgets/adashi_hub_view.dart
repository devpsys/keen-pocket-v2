import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/core/localization/l10n_extension.dart';
import 'package:keenpockets/features/adashi/presentation/view_models/adashi_view.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_admin_header.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_cycle_card.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_cycles_history.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_disputes_banner.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/adashi_payout_card.dart';
import 'package:keenpockets/features/adashi/presentation/widgets/rotation_timeline.dart';

/// Phone layout for the Adashi hub (design `adashi_hub`): admin header, current
/// cycle, rotation timeline, payout account, cycles history and disputes.
class AdashiHubView extends StatelessWidget {
  const AdashiHubView({required this.detail, super.key});

  final AdashiDetailView detail;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.l,
        KpSpacing.m,
        KpSpacing.xxxl + KpSpacing.m,
      ),
      children: [
        AdashiAdminHeader(detail: detail),
        const Gap.l(),
        AdashiCycleCard(detail: detail),
        const Gap.l(),
        Text(
          context.l10n.adashiHubRotationTitle,
          style: context.textTheme.headlineSmall,
        ),
        const Gap.m(),
        RotationTimeline(members: detail.rotation),
        const Gap.l(),
        AdashiPayoutCard(bank: detail.payoutBank),
        const Gap.l(),
        AdashiCyclesHistory(history: detail.history),
        const Gap.l(),
        const AdashiDisputesBanner(),
      ],
    );
  }
}
