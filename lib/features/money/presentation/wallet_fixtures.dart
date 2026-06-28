import 'package:core/core.dart';

import 'package:keenpockets/features/money/presentation/view_models/wallet_view.dart';

/// PRESENTATION-ONLY sample wallet (designs `wallet_home` / `_tablet`). Swap for
/// real wallet data when the money rails are enabled.

/// Quick top-up amounts (₦) shown as chips on the tablet.
const kWalletQuickAdds = <int>[1000, 5000, 10000];

final kWallet = WalletView(
  balance: Money.naira(12500),
  monthlyDelta: '+4.5% this month',
  spendingUsed: Money.naira(16000),
  spendingLimit: Money.naira(25000),
  mascotTip: "You're doing great! You saved ₦2,400 more than last month.",
  transactions: [
    WalletTxnView(
      id: 't1',
      label: 'Top up',
      amount: Money.naira(5000),
      isCredit: true,
      kind: WalletTxnKind.topUp,
      timeAgo: 'Today, 10:45 AM',
      balanceAfter: Money.naira(12500),
      source: 'Via Bank Transfer',
      status: WalletTxnStatus.success,
    ),
    WalletTxnView(
      id: 't2',
      label: 'Pocket payment',
      amount: Money.naira(2300),
      isCredit: false,
      kind: WalletTxnKind.payment,
      timeAgo: 'Yesterday, 4:20 PM',
      balanceAfter: Money.naira(7500),
      source: 'Grocery Savings',
      status: WalletTxnStatus.settled,
    ),
    WalletTxnView(
      id: 't3',
      label: 'Refund',
      amount: Money.naira(1200),
      isCredit: true,
      kind: WalletTxnKind.refund,
      timeAgo: 'Oct 24, 11:05 AM',
      balanceAfter: Money.naira(9800),
      source: 'Amazon Marketplace',
      status: WalletTxnStatus.refunded,
    ),
  ],
);
