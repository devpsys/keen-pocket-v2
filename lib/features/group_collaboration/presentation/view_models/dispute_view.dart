/// Lifecycle of a dispute case.
enum DisputeStatus { open, resolved, dismissed }

/// State of a single case-timeline step (design `disputes_hub_tablet`).
enum DisputeTimelineState { done, active, pending }

/// One entry in a case's timeline (tablet detail view).
class DisputeTimelineEntry {
  const DisputeTimelineEntry({
    required this.title,
    required this.time,
    required this.state,
    this.body,
  });

  final String title;
  final String time; // already-formatted, e.g. "Today, 09:45 AM"
  final DisputeTimelineState state;
  final String? body;
}

/// UI-shaped dispute case (presentation-only placeholder for now).
class DisputeView {
  const DisputeView({
    required this.id,
    required this.title,
    required this.author,
    required this.timeAgo,
    required this.description,
    required this.status,
    this.resolutionNote,
    this.caseNumber,
    this.previewQuote,
    this.investigation,
    this.draftNote,
    this.timeline = const [],
  });

  final String id;
  final String title;
  final String author;
  final String timeAgo; // e.g. "2d ago" — already-formatted by the caller
  final String description;
  final DisputeStatus status;
  final String? resolutionNote;

  // ── Tablet detail extras (design `disputes_hub_tablet`) ───────────────────
  final String? caseNumber; // e.g. "KP-2024-884"
  final String? previewQuote; // italic snippet in the master list
  final String? investigation; // "Active Investigation" body
  final String? draftNote; // "Resolution Note (Draft)" body
  final List<DisputeTimelineEntry> timeline;
}
