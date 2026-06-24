/// UI-shaped chat message (presentation-only placeholder for now).
class ChatMessageView {
  const ChatMessageView({
    required this.id,
    required this.author,
    required this.text,
    required this.isMine,
    this.time = '',
    this.authorTint = ChatAuthorTint.primary,
    this.avatarUrl,
  });

  final String id;
  final String author;
  final String text;
  final bool isMine;
  final String time; // e.g. "09:41 AM"
  final ChatAuthorTint authorTint;

  /// Incoming-author portrait (tablet chat area shows avatars; phone does not).
  final String? avatarUrl;
}

/// Author-name accent for incoming bubbles (design alternates primary/secondary).
enum ChatAuthorTint { primary, secondary }
