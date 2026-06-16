/// UI-shaped notification (presentation-only placeholder for now).
class NotificationView {
  const NotificationView({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
  });

  final String id;
  final String title;
  final String body;
  final bool isRead;

  NotificationView markRead() =>
      NotificationView(id: id, title: title, body: body, isRead: true);
}
