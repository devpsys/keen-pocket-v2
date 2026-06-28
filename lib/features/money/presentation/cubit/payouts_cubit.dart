import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/presentation/cubit/payouts_state.dart';
import 'package:keenpockets/features/money/presentation/payouts_fixtures.dart';

/// PRESENTATION-ONLY: sample-backed payouts/bank hub (designs `payouts_bank_hub`
/// / `_tablet`). Swap for a real use case when the money rails are enabled.
@injectable
class PayoutsCubit extends Cubit<PayoutsState> {
  PayoutsCubit() : super(const PayoutsState());

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading));
    emit(
      state.copyWith(
        status: StateStatus.success,
        collections: kPayoutCollections,
        tabletCollections: kPayoutCollectionsTablet,
        payouts: kPayoutsReceived,
        totalCollected: kPayoutsTotalCollected,
        mascotTip: kPayoutsMascotTip,
      ),
    );
  }
}
