import 'package:core/core.dart';

/// Kind of wallet activity — drives the row icon and tint.
enum WalletTxnKind { topUp, payment, refund }

/// Settlement state shown as a pill on the tablet activity rows.
enum WalletTxnStatus { success, settled, refunded }

/// UI-shaped wallet projections (presentation-only placeholder for now).
class WalletTxnView {
  const WalletTxnView({
    required this.id,
    required this.label,
    required this.amount,
    required this.isCredit,
    required this.kind,
    required this.timeAgo,
    this.balanceAfter,
    this.source,
    this.status,
  });

  final String id;
  final String label;
  final Money amount;
  final bool isCredit;
  final WalletTxnKind kind;
  final String timeAgo; // "Today, 10:45 AM"
  final Money? balanceAfter; // phone: "Balance: ₦12,500"
  final String? source; // tablet: "Via Bank Transfer"
  final WalletTxnStatus? status; // tablet pill
}

class WalletView {
  const WalletView({
    required this.balance,
    required this.transactions,
    this.monthlyDelta,
    this.spendingUsed,
    this.spendingLimit,
    this.mascotTip,
  });

  final Money balance;
  final List<WalletTxnView> transactions;

  // Tablet cockpit extras.
  final String? monthlyDelta; // "+4.5% this month"
  final Money? spendingUsed;
  final Money? spendingLimit;
  final String? mascotTip;

  double get spendingProgress {
    final used = spendingUsed;
    final limit = spendingLimit;
    if (used == null || limit == null || limit.kobo == 0) return 0;
    return (used.kobo / limit.kobo).clamp(0, 1);
  }
}
