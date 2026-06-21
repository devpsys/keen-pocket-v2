import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:keenpockets/features/pockets/domain/entities/pocket.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_contributions_card_tablet.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_group_rules_tablet.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_group_shopping_tablet.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_identity_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_members_roster_tablet.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_mr_k_card.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_pending_approvals_tablet.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_progress_card_tablet.dart';
import 'package:keenpockets/features/pockets/presentation/widgets/pocket_top_contributors_tablet.dart';

/// Tablet/desktop layout for the pocket detail hub (`pocket_detail_hub_tablet`).
///
/// A 12-column grid expressed as three rails — identity (left), progress &
/// lists (centre), approvals & members (right) — above a full-width group rules
/// card.
class PocketDetailTabletView extends StatelessWidget {
  const PocketDetailTabletView({
    required this.pocket,
    required this.role,
    super.key,
  });

  static const int _leftFlex = 3;
  static const int _centerFlex = 5;
  static const int _rightFlex = 4;

  final Pocket pocket;
  final PocketRole role;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(KpSpacing.s),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: _leftFlex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PocketIdentityCard(pocket: pocket),
                  const Gap.s(),
                  const PocketMrKCard(),
                ],
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              flex: _centerFlex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PocketProgressCardTablet(pocket: pocket),
                  const Gap.s(),
                  PocketContributionsCardTablet(pocket: pocket, role: role),
                  const Gap.s(),
                  const PocketGroupShoppingTablet(),
                ],
              ),
            ),
            const Gap.s(horizontal: true),
            Expanded(
              flex: _rightFlex,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const PocketPendingApprovalsTablet(),
                  const Gap.s(),
                  PocketMembersRosterTablet(pocket: pocket),
                  const Gap.s(),
                  const PocketTopContributorsTablet(),
                ],
              ),
            ),
          ],
        ),
        const Gap.s(),
        const PocketGroupRulesTablet(),
      ],
    );
  }
}
