import 'package:core/core.dart';

import 'package:keenpockets/features/administration/presentation/view_models/organiser_view.dart';

/// PRESENTATION-ONLY sample organiser dashboard (design `admin_health_dashboard`).
/// Swap for real data when the organiser APIs exist.

/// Winking Mr. K shown on the welcome hero.
const kOrganiserMascotUrl =
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAPh5zxQATyNYoVk8A1VKr33UmklIBnfNzJY_2MnlS1e_P3rmkdqgA-GWTBfotCK4Ax0GatcnZA9xI1GAC0zAUCTEA1Iw2twQC0zpE4nsMJDA_Gj2qH37a3sFu7luqVc-6MRe5YNiI8rMNyso9Jeg2PcVmas1lrGd4qODwj0mWU-tjlpeLR-MiKjxycmA4nySsAKVSPZPoA4AxRrynEmlYmGt-onNd5DpuiNNoGYWGlobyk1K9QXR3lsQmpwUAKXLlFLoZ5ax8GUGc';

final kOrganiser = OrganiserView(
  activePockets: 12,
  totalManaged: Money.naira(4200000),
  managedDeltaPct: 12,
  activeMembers: 842,
  newMembersToday: 24,
  urgentActions: 5,
  pockets: [
    OrganiserPocketView(
      type: OrganiserPocketType.adashi,
      name: 'Lagos Techies Cycle',
      members: 12,
      collected: Money.naira(450000),
      target: Money.naira(1200000),
      health: PocketHealth.pending,
      healthCount: 2,
    ),
    OrganiserPocketView(
      type: OrganiserPocketType.savings,
      name: "Yemi's Wedding Fund",
      members: 45,
      collected: Money.naira(2100000),
      target: Money.naira(2500000),
      health: PocketHealth.atRisk,
      healthCount: 3,
    ),
    OrganiserPocketView(
      type: OrganiserPocketType.adashi,
      name: 'Q3 School Fees Coop',
      members: 28,
      collected: Money.naira(8400000),
      target: Money.naira(9000000),
      health: PocketHealth.healthy,
      healthCount: 0,
    ),
    OrganiserPocketView(
      type: OrganiserPocketType.savings,
      name: 'Mainland Rent Pool',
      members: 18,
      collected: Money.naira(1200000),
      target: Money.naira(4000000),
      health: PocketHealth.overdue,
      healthCount: 5,
    ),
  ],
  pulse: const [
    PulseItemView(
      title: "Verify Tunde's Contribution",
      subtitle: 'Lagos Techies Cycle • Just now',
      tone: PulseTone.info,
      action: PulseAction.review,
    ),
    PulseItemView(
      title: 'Nudge 3 at-risk members',
      subtitle: "Yemi's Wedding Fund • 2h ago",
      tone: PulseTone.urgent,
      action: PulseAction.nudge,
    ),
  ],
);
