import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_charity_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_contributions_section.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_group_rules_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_group_shopping.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_header_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_members_section.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_payout_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_pending_approvals.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_progress_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_top_contributors_card.dart';

/// Single-column mobile (phone) view of the pocket detail hub
/// (design `pocket_detail_hub`). Composes the hub's sections top-to-bottom in a
/// scrollable list, leaving room at the foot for the floating chat button.
class PocketDetailPhoneView extends StatelessWidget {
  const PocketDetailPhoneView({
    required this.pocket,
    required this.role,
    super.key,
  });

  /// Bottom inset so the floating chat button clears the last card.
  static const double _bottomInset = KpSpacing.xxxl + KpSpacing.m;

  final Pocket pocket;
  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        KpSpacing.m,
        KpSpacing.m,
        KpSpacing.m,
        _bottomInset,
      ),
      children: [
        PocketHeaderCard(pocket: pocket, role: role),
        const Gap.l(),
        const PocketPendingApprovals(),
        const Gap.l(),
        PocketProgressCard(pocket: pocket),
        const Gap.l(),
        PocketContributionsSection(pocket: pocket, role: role),
        const Gap.l(),
        PocketCharityCard(pocket: pocket, role: role),
        const Gap.l(),
        const PocketGroupShopping(),
        const Gap.l(),
        const PocketPayoutCard(),
        const Gap.l(),
        const PocketMembersSection(),
        const Gap.l(),
        const PocketTopContributorsCard(),
        const Gap.l(),
        const PocketGroupRulesCard(),
      ],
    );
  }
}
