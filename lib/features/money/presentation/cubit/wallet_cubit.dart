import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';
import 'package:keenpockets/features/money/presentation/view_models/wallet_view.dart';

/// PRESENTATION-ONLY: placeholder wallet data; swap for a use case later.
@injectable
class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        wallet: const WalletView(
          balance: Money(12450000),
          transactions: [
            WalletTxnView(
              id: 't1',
              label: 'Top-up',
              amount: Money(5000000),
              isCredit: true,
            ),
            WalletTxnView(
              id: 't2',
              label: 'Pocket contribution',
              amount: Money(2000000),
              isCredit: false,
            ),
          ],
        ),
      ),
    );
  }
}
