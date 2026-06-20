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

/// Lifecycle of a payout cycle on the rotation screen.
enum CycleStepStatus { done, active, next, locked }

/// One cycle row on the rotation screen (design `adashi_rotation`).
class AdashiCycleStep {
  const AdashiCycleStep({
    required this.cycleNumber,
    required this.recipientName,
    required this.status,
    required this.amount,
    this.dateLabel,
    this.daysLeft,
    this.avatarUrl,
  });

  final int cycleNumber;
  final String recipientName;
  final CycleStepStatus status;
  final Money amount;
  final String? dateLabel; // e.g. "June 12"
  final int? daysLeft; // active cycle countdown
  final String? avatarUrl;
}

/// Per-cycle state of a member on the rotation screen.
enum RotationMemberState { contributed, pending, you, scheduled }

/// A member row on the rotation screen.
class AdashiRotationMember {
  const AdashiRotationMember({
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.kycLevel,
    this.state = RotationMemberState.pending,
    this.contributed,
  });

  final String name;
  final String avatarUrl;
  final String rating; // e.g. "4.9"
  final int kycLevel;
  final RotationMemberState state;

  /// Amount contributed this cycle; null ⇒ nothing paid yet.
  final Money? contributed;

  bool get isPending => contributed == null;
}

/// Status of a member on the manage screen.
enum ManageMemberStatus { received, active }

/// A row in the manage-screen members table.
class AdashiManageMember {
  const AdashiManageMember({
    required this.position,
    required this.name,
    required this.avatarUrl,
    required this.status,
    this.isReceiver = false,
  });

  final int position;
  final String name;
  final String avatarUrl;
  final ManageMemberStatus status;
  final bool isReceiver;
}

/// A payment awaiting the organiser's verification.
class AdashiPendingPayment {
  const AdashiPendingPayment({required this.name, required this.amount});

  final String name;
  final Money amount;
}

/// Organiser "manage circle" projection (design `manage_adashi`).
class AdashiManageView {
  const AdashiManageView({
    required this.groupName,
    required this.memberCount,
    required this.activeMembers,
    required this.nextAvailableSlot,
    required this.members,
    required this.pending,
    required this.nextPosition,
    required this.currentSlot,
    required this.totalSlots,
  });

  final String groupName;
  final int memberCount;

  /// Members currently participating (tablet roster shows "{active} / {total}").
  final int activeMembers;

  /// Next free rotation slot offered when inviting (tablet add-member).
  final int nextAvailableSlot;
  final List<AdashiManageMember> members;
  final List<AdashiPendingPayment> pending;

  /// Position the payout rotates to after reconciling.
  final int nextPosition;
  final int currentSlot;
  final int totalSlots;
}

/// Full rotation screen projection (design `adashi_rotation`).
class AdashiRotationView {
  const AdashiRotationView({
    required this.groupName,
    required this.avatarUrl,
    required this.currentPot,
    required this.target,
    required this.percent,
    required this.payoutDaysLeft,
    required this.tip,
    required this.cycles,
    required this.members,
  });

  final String groupName;
  final String avatarUrl;
  final Money currentPot;
  final Money target;
  final int percent; // 0–100
  final int payoutDaysLeft;
  final String tip;
  final List<AdashiCycleStep> cycles;
  final List<AdashiRotationMember> members;

  int get activeMembers => members.length;
}

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
