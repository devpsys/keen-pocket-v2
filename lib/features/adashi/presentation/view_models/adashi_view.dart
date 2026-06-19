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
  });

  final String id;
  final String name;
  final int position; // 1-based
  final RotationStatus status;
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

/// Full detail incl. the rotation order.
class AdashiDetailView {
  const AdashiDetailView({required this.summary, required this.rotation});

  final AdashiSummaryView summary;
  final List<AdashiMemberView> rotation;

  AdashiMemberView? get currentReceiver => rotation
      .where((m) => m.status == RotationStatus.current)
      .cast<AdashiMemberView?>()
      .firstWhere((_) => true, orElse: () => null);
}
