import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:keenpockets/features/money/presentation/view_models/wallet_view.dart';

part 'wallet_state.freezed.dart';

@freezed
abstract class WalletState with _$WalletState {
  const factory WalletState({
    @Default(StateStatus.initial) StateStatus status,
    WalletView? wallet,
  }) = _WalletState;
}
