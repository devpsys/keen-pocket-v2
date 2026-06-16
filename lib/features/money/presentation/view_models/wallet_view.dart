import 'package:core/core.dart';

/// UI-shaped wallet projections (presentation-only placeholder for now).
class WalletTxnView {
  const WalletTxnView({
    required this.id,
    required this.label,
    required this.amount,
    required this.isCredit,
  });

  final String id;
  final String label;
  final Money amount;
  final bool isCredit;
}

class WalletView {
  const WalletView({required this.balance, required this.transactions});

  final Money balance;
  final List<WalletTxnView> transactions;
}
