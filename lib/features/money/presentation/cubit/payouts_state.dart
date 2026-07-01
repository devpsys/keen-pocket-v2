import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/money/presentation/view_models/bank_account_view.dart';
import 'package:keenpockets/features/money/presentation/view_models/payout_view.dart';

part 'payouts_state.freezed.dart';

@freezed
abstract class PayoutsState with _$PayoutsState {
  const factory PayoutsState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(<BankAccountView>[]) List<BankAccountView> collections,
    @Default(<PayoutCollectionView>[])
    List<PayoutCollectionView> tabletCollections,
    @Default(<PayoutView>[]) List<PayoutView> payouts,
    Money? totalCollected,
    String? mascotTip,
    Failure? failure,
  }) = _PayoutsState;
}
