import 'package:core/core.dart';

/// UI-shaped projections for the Adashi screens.
///
/// PRESENTATION-ONLY (Phase 5): these view models exist so the UI can be built
/// now. When the domain/data layers land, an `Adashi` entity + a mapper will
/// produce these from real data; the widgets/cubits below won't change.
enum RotationMode { auto, manual }

/// How often a circle collects + pays out (drives the card's frequency pill).
enum AdashiFrequency { weekly, monthly }

/// Visual category for a circle — maps to the card's tinted glyph.
enum AdashiCategory { home, vehicle, education, business, market }

/// A member's place in the rotation.
enum RotationStatus { received, current, upcoming }

class AdashiMemberView {
  const AdashiMemberView({
    required this.id,
    required this.name,
    required this.position,
    required this.status,
    this.avatarUrl,
    this.dateLabel,
    this.amountLabel,
    this.isYou = false,
  });

  final String id;
  final String name;
  final int position; // 1-based
  final RotationStatus status;

  /// Portrait URL (null ⇒ render initials).
  final String? avatarUrl;

  /// e.g. "Received: Oct 12" / "Projected: Nov 12" — already formatted.
  final String? dateLabel;

  /// e.g. "₦80k" — already formatted.
  final String? amountLabel;

  /// True for the signed-in user's own row (gets the "Your turn" treatment).
  final bool isYou;
}

/// A closed/active row in the cycles-history table.
class AdashiCycleRecord {
  const AdashiCycleRecord({
    required this.label,
    required this.total,
    required this.closed,
  });

  final String label;
  final Money total;
  final bool closed;
}

/// Row in the Adashi list.
class AdashiSummaryView {
  const AdashiSummaryView({
    required this.id,
    required this.name,
    required this.perCycle,
    required this.memberCount,
    required this.currentCycle,
    required this.totalCycles,
    required this.mode,
    this.frequency = AdashiFrequency.monthly,
    this.category = AdashiCategory.business,
    this.isActive = true,
    this.nextPayoutDays = 0,
    this.memberAvatarUrls = const [],
  });

  final String id;
  final String name;
  final Money perCycle;
  final int memberCount;
  final int currentCycle;
  final int totalCycles;
  final RotationMode mode;
  final AdashiFrequency frequency;
  final AdashiCategory category;

  /// Active (still rotating) vs completed — drives the list filter + count.
  final bool isActive;

  /// Days until the next payout (0 ⇒ due today).
  final int nextPayoutDays;

  /// Portrait URLs for the overlapping member avatars on the card.
  final List<String> memberAvatarUrls;

  double get progress => totalCycles == 0 ? 0 : currentCycle / totalCycles;

  /// Members not shown in the avatar stack (the "+N" chip).
  int get extraMembers =>
      (memberCount - memberAvatarUrls.length).clamp(0, memberCount);
}

/// Full detail incl. the rotation order and the hub's cycle/admin/payout data.
class AdashiDetailView {
  const AdashiDetailView({
    required this.summary,
    required this.rotation,
    required this.adminName,
    required this.adminAvatarUrl,
    required this.reputation,
    required this.paidMembers,
    required this.collected,
    required this.target,
    required this.receiverName,
    required this.receiverAmount,
    required this.contributeAmount,
    required this.payoutBank,
    required this.history,
    this.nextPayoutDate = '',
    this.openDisputes = 0,
    this.disputeTitle,
    this.disputeBody,
    this.closedCases = '',
    this.avgResolve = '',
    this.groupHealth = '',
    this.totalSaved = '',
    this.securityStatus = '',
  });

  final AdashiSummaryView summary;
  final List<AdashiMemberView> rotation;

  /// Group admin / organiser.
  final String adminName;
  final String adminAvatarUrl;
  final String reputation; // e.g. "4.9"

  final int paidMembers;
  final Money collected;
  final Money target;

  /// Who receives this cycle's pot.
  final String receiverName;
  final Money receiverAmount;

  /// The user's contribution amount for this cycle (the CTA amount).
  final Money contributeAmount;

  /// Masked payout account, e.g. "GTBank •••• 8291".
  final String payoutBank;

  final List<AdashiCycleRecord> history;

  // ── Tablet cockpit extras (design `adashi_hub_tablet`) ──────────────────────
  /// Pre-formatted next-payout date, e.g. "Friday, 28th August".
  final String nextPayoutDate;
  final int openDisputes;
  final String? disputeTitle;
  final String? disputeBody;
  final String closedCases; // e.g. "14"
  final String avgResolve; // e.g. "4h"
  final String groupHealth; // e.g. "Excellent (98%)"
  final String totalSaved; // e.g. "₦1.4M"
  final String securityStatus; // e.g. "Fully Insured"

  /// 0–1 fraction of members who have paid this cycle.
  double get collectionProgress =>
      summary.memberCount == 0 ? 0 : paidMembers / summary.memberCount;

  AdashiMemberView? get currentReceiver => rotation
      .where((m) => m.status == RotationStatus.current)
      .cast<AdashiMemberView?>()
      .firstWhere((_) => true, orElse: () => null);
}
