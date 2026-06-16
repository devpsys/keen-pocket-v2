/// UI-shaped chat message (presentation-only placeholder for now).
class ChatMessageView {
  const ChatMessageView({
    required this.id,
    required this.author,
    required this.text,
    required this.isMine,
  });

  final String id;
  final String author;
  final String text;
  final bool isMine;
}
