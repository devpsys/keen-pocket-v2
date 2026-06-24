/// Category of a notification — drives the icon, emoji and accent tint.
enum NotificationKind {
  payment,
  member,
  invite,
  reminder,
  security,
  adashi,
  support,
}

/// UI-shaped notification (presentation-only placeholder for now).
class NotificationView {
  const NotificationView({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.timeAgo,
    this.kind = NotificationKind.payment,
    this.dateLabel,
    this.category,
    this.detailBody,
    this.goalPercent,
    this.savedLabel,
    this.targetLabel,
    this.relatedPocket,
    this.relatedPocketImageUrl,
    this.sourceAccount,
    this.mascotTip,
  });

  final String id;
  final String title;
  final String body;
  final bool isRead;
  final String timeAgo; // already-formatted, e.g. "2m ago"
  final NotificationKind kind;

  // ── Tablet detail extras (design `notifications_inbox_tablet`) ────────────
  final String? dateLabel; // "Oct 24, 2023 • 10:32 AM"
  final String? category; // "TRANSACTION"
  final String? detailBody; // long-form message
  final double? goalPercent; // 0..1 — shows a progress block when present
  final String? savedLabel; // "₦2,450.00 saved"
  final String? targetLabel; // "Target: ₦3,000.00"
  final String? relatedPocket; // "Summer Vibes"
  final String? relatedPocketImageUrl;
  final String? sourceAccount; // "Main Wallet (*8821)"
  final String? mascotTip;

  /// Emoji shown in the phone list tile (design `notifications_inbox`).
  String get emoji => switch (kind) {
    NotificationKind.payment => '💰',
    NotificationKind.member => '👤',
    NotificationKind.invite => '📨',
    NotificationKind.reminder => '⏰',
    NotificationKind.security => '⚠️',
    NotificationKind.adashi => '🤝',
    NotificationKind.support => '💬',
  };

  NotificationView markRead() => NotificationView(
    id: id,
    title: title,
    body: body,
    isRead: true,
    timeAgo: timeAgo,
    kind: kind,
    dateLabel: dateLabel,
    category: category,
    detailBody: detailBody,
    goalPercent: goalPercent,
    savedLabel: savedLabel,
    targetLabel: targetLabel,
    relatedPocket: relatedPocket,
    relatedPocketImageUrl: relatedPocketImageUrl,
    sourceAccount: sourceAccount,
    mascotTip: mascotTip,
  );
}
