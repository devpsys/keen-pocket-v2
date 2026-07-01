import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/domain/entities/wallet.dart';
import 'package:keenpockets/features/money/domain/repositories/wallet_repository.dart';

/// Dev-only stub so the wallet renders without a backend. Mirrors the old
/// presentation fixtures. `prod`/`staging` use [WalletRepositoryImpl].
@LazySingleton(as: WalletRepository, env: ['dev'])
class FakeWalletRepository implements WalletRepository {
  const FakeWalletRepository();

  @override
  Future<Result<Wallet>> getWallet() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return Right(
      Wallet(
        balance: Money.naira(12500),
        monthlyDelta: '+4.5% this month',
        spendingUsed: Money.naira(16000),
        spendingLimit: Money.naira(25000),
        mascotTip: "You're doing great! You saved ₦2,400 more than last month.",
        transactions: [
          WalletTransaction(
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
          WalletTransaction(
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
          WalletTransaction(
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
      ),
    );
  }
}
