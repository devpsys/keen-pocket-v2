import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/domain/entities/wallet.dart';
import 'package:keenpockets/features/money/domain/usecases/get_wallet.dart';
import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';
import 'package:keenpockets/features/money/presentation/view_models/wallet_view.dart'
    as vm;

/// Loads the user's wallet via [GetWallet] and projects the entity into the
/// presentation [WalletView].
@injectable
class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this._getWallet) : super(const WalletState());

  final GetWallet _getWallet;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getWallet(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (wallet) => state.copyWith(
          status: StateStatus.success,
          wallet: wallet.toView(),
          failure: null,
        ),
      ),
    );
  }
}

extension on Wallet {
  vm.WalletView toView() => vm.WalletView(
    balance: balance,
    monthlyDelta: monthlyDelta,
    spendingUsed: spendingUsed,
    spendingLimit: spendingLimit,
    mascotTip: mascotTip,
    transactions: transactions.map((t) => t.toView()).toList(),
  );
}

extension on WalletTransaction {
  vm.WalletTxnView toView() => vm.WalletTxnView(
    id: id,
    label: label,
    amount: amount,
    isCredit: isCredit,
    kind: switch (kind) {
      WalletTxnKind.topUp => vm.WalletTxnKind.topUp,
      WalletTxnKind.payment => vm.WalletTxnKind.payment,
      WalletTxnKind.refund => vm.WalletTxnKind.refund,
    },
    timeAgo: timeAgo,
    balanceAfter: balanceAfter,
    source: source,
    status: switch (status) {
      WalletTxnStatus.success => vm.WalletTxnStatus.success,
      WalletTxnStatus.settled => vm.WalletTxnStatus.settled,
      WalletTxnStatus.refunded => vm.WalletTxnStatus.refunded,
      null => null,
    },
  );
}
