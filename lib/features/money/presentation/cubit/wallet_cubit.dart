import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/presentation/cubit/wallet_state.dart';
import 'package:keenpockets/features/money/presentation/wallet_fixtures.dart';

/// PRESENTATION-ONLY: sample-backed wallet (designs `wallet_home` / `_tablet`).
/// Swap for a real use case when the money rails are enabled.
@injectable
class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(state.copyWith(status: StateStatus.success, wallet: kWallet));
  }
}
