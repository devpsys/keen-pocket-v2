/// Lifecycle of a dispute case.
enum DisputeStatus { open, resolved, dismissed }

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
  });

  final String id;
  final String title;
  final String author;
  final String timeAgo; // e.g. "2d ago" — already-formatted by the caller
  final String description;
  final DisputeStatus status;
  final String? resolutionNote;
}
