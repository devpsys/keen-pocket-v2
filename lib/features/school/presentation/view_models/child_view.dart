import 'package:core/core.dart';

/// Avatar tile tone for a linked child (design `my_children`): boys use the
/// gold secondary tile, girls the soft tertiary tile.
enum ChildAvatarTone { boy, girl }

/// Payment status of a single term (design `my_children`).
enum ChildTermStatus { paid, partial, unpaid }

/// One term's fee progress for a child (design `my_children`).
class ChildTermView {
  const ChildTermView({
    required this.label,
    required this.fee,
    required this.paid,
    required this.status,
  });

  final String label; // "Term 1"
  final Money fee;
  final Money paid;
  final ChildTermStatus status;

  Money get balance => Money(fee.kobo - paid.kobo);
  double get percent => fee.kobo == 0 ? 0 : (paid.kobo / fee.kobo).clamp(0, 1);
}

/// A linked child and their tuition plan (design `my_children`).
class ChildView {
  const ChildView({
    required this.name,
    required this.school,
    required this.className,
    required this.emoji,
    required this.tone,
    required this.planLabel,
    required this.terms,
    this.avatarUrl,
    this.nextInvoiceDays = 0,
    this.receiptCount = 0,
  });

  final String name;
  final String school;
  final String className;
  final String emoji; // 👦 / 👧 (phone tiles)
  final ChildAvatarTone tone;
  final String planLabel; // "30/30/40 Split"
  final List<ChildTermView> terms;

  /// Photo avatar shown on the tablet cards (design `my_children_tablet`).
  final String? avatarUrl;

  /// Paid-up only: days until the next invoice ("Next invoice in 45 days").
  final int nextInvoiceDays;

  /// Paid-up only: number of receipts ("2 documents found").
  final int receiptCount;

  /// True when every term is fully paid → the card shows a disabled "Paid Up".
  bool get isPaidUp => terms.every((t) => t.status == ChildTermStatus.paid);
}
