import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/domain/entities/payout.dart';
import 'package:keenpockets/features/money/domain/repositories/payouts_repository.dart';

/// Dev-only stub so the payouts hub renders without a backend. Mirrors the old
/// presentation fixtures. `prod`/`staging` use [PayoutsRepositoryImpl].
@LazySingleton(as: PayoutsRepository, env: ['dev'])
class FakePayoutsRepository implements PayoutsRepository {
  const FakePayoutsRepository();

  @override
  Future<Result<PayoutsHub>> getPayoutsHub() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return Right(
      PayoutsHub(
        totalCollected: Money.naira(1450400),
        mascotTip:
            'Mr. K says: "Switching banks is easy! Your next payout will '
            'follow your updated choice instantly."',
        bankAccounts: const [
          BankAccount(
            id: 'c1',
            label: 'Emergency Fund',
            subtitle: 'Primary Savings',
            bankName: 'Zenith Bank',
            maskedNuban: '**** 5521',
          ),
          BankAccount(
            id: 'c2',
            label: 'Education Pocket',
            subtitle: 'Uni Tuition',
            bankName: 'Access Bank',
            maskedNuban: '**** 0988',
          ),
        ],
        collections: [
          PayoutCollection(
            id: 'c1',
            name: 'Emergency Fund',
            bankName: 'Zenith Bank',
            amount: Money.naira(250400),
            percent: 0.65,
          ),
          PayoutCollection(
            id: 'c2',
            name: 'Education Pocket',
            bankName: 'Access Bank',
            amount: Money.naira(1200000),
            percent: 0.48,
            progressLabel: 'Target: ₦2.5M',
          ),
        ],
        payouts: [
          Payout(
            id: 'p1',
            reference: 'KP-9921-X',
            amount: Money.naira(45000),
            status: PayoutStatus.success,
            dateLabel: 'Oct 24, 2023',
            bankName: 'Zenith Bank',
          ),
          Payout(
            id: 'p2',
            reference: 'KP-9918-B',
            amount: Money.naira(12500),
            status: PayoutStatus.pending,
            dateLabel: 'Oct 26, 2023',
            bankName: 'Access Bank',
          ),
          Payout(
            id: 'p3',
            reference: 'KP-9877-Z',
            amount: Money.naira(8000),
            status: PayoutStatus.failed,
            dateLabel: 'Oct 19, 2023',
            bankName: 'GTBank',
          ),
          Payout(
            id: 'p4',
            reference: 'KP-9821-M',
            amount: Money.naira(150000),
            status: PayoutStatus.success,
            dateLabel: 'Oct 12, 2023',
            bankName: 'Zenith Bank',
          ),
        ],
      ),
    );
  }
}
