import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:keenpockets/features/money/domain/entities/payout.dart';
import 'package:keenpockets/features/money/domain/usecases/get_payouts.dart';
import 'package:keenpockets/features/money/presentation/cubit/payouts_state.dart';
import 'package:keenpockets/features/money/presentation/view_models/bank_account_view.dart';
import 'package:keenpockets/features/money/presentation/view_models/payout_view.dart'
    as vm;

/// Loads the payouts/bank hub via [GetPayouts] and projects the aggregate into
/// the presentation view models.
@injectable
class PayoutsCubit extends Cubit<PayoutsState> {
  PayoutsCubit(this._getPayouts) : super(const PayoutsState());

  final GetPayouts _getPayouts;

  Future<void> load() async {
    emit(state.copyWith(status: StateStatus.loading, failure: null));
    final result = await _getPayouts(const NoParams());
    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: StateStatus.failure, failure: failure),
        (hub) => state.copyWith(
          status: StateStatus.success,
          collections: hub.bankAccounts.map((b) => b.toView()).toList(),
          tabletCollections: hub.collections.map((c) => c.toView()).toList(),
          payouts: hub.payouts.map((p) => p.toView()).toList(),
          totalCollected: hub.totalCollected,
          mascotTip: hub.mascotTip,
          failure: null,
        ),
      ),
    );
  }
}

extension on BankAccount {
  BankAccountView toView() => BankAccountView(
    id: id,
    label: label,
    subtitle: subtitle,
    bankName: bankName,
    maskedNuban: maskedNuban,
  );
}

extension on PayoutCollection {
  vm.PayoutCollectionView toView() => vm.PayoutCollectionView(
    id: id,
    name: name,
    bankName: bankName,
    amount: amount,
    percent: percent,
    progressLabel: progressLabel,
  );
}

extension on Payout {
  vm.PayoutView toView() => vm.PayoutView(
    id: id,
    reference: reference,
    amount: amount,
    status: switch (status) {
      PayoutStatus.success => vm.PayoutStatus.success,
      PayoutStatus.pending => vm.PayoutStatus.pending,
      PayoutStatus.failed => vm.PayoutStatus.failed,
    },
    dateLabel: dateLabel,
    bankName: bankName,
  );
}
