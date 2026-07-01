import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_dto.freezed.dart';
part 'wallet_dto.g.dart';

/// Wire model for a wallet ledger entry (see docs/API_SPEC.md §4).
/// Money fields are integer kobo; `kind`/`status` are snake_case tokens.
@freezed
abstract class WalletTransactionDto with _$WalletTransactionDto {
  const factory WalletTransactionDto({
    required String id,
    required String label,
    required int amount, // kobo
    @JsonKey(name: 'is_credit') required bool isCredit,
    required String kind, // top_up | payment | refund
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'balance_after') int? balanceAfter, // kobo
    String? source,
    String? status, // success | settled | refunded
  }) = _WalletTransactionDto;

  factory WalletTransactionDto.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionDtoFromJson(json);
}

/// Wire model for `GET /wallet` (see docs/API_SPEC.md §4).
@freezed
abstract class WalletDto with _$WalletDto {
  const factory WalletDto({
    required int balance, // kobo
    @Default(<WalletTransactionDto>[]) List<WalletTransactionDto> transactions,
    @JsonKey(name: 'monthly_delta') String? monthlyDelta,
    @JsonKey(name: 'spending_used') int? spendingUsed, // kobo
    @JsonKey(name: 'spending_limit') int? spendingLimit, // kobo
    @JsonKey(name: 'mascot_tip') String? mascotTip,
  }) = _WalletDto;

  factory WalletDto.fromJson(Map<String, dynamic> json) =>
      _$WalletDtoFromJson(json);
}
