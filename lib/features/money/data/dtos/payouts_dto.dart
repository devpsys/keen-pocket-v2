import 'package:freezed_annotation/freezed_annotation.dart';

part 'payouts_dto.freezed.dart';
part 'payouts_dto.g.dart';

/// Wire model for a received payout (money as integer kobo).
@freezed
abstract class PayoutDto with _$PayoutDto {
  const factory PayoutDto({
    required String id,
    required String reference,
    required int amount, // kobo
    required String status, // success | pending | failed
    @JsonKey(name: 'date_label') String? dateLabel,
    @JsonKey(name: 'bank_name') String? bankName,
  }) = _PayoutDto;

  factory PayoutDto.fromJson(Map<String, dynamic> json) =>
      _$PayoutDtoFromJson(json);
}

/// Wire model for a pocket's collection account + progress.
@freezed
abstract class PayoutCollectionDto with _$PayoutCollectionDto {
  const factory PayoutCollectionDto({
    required String id,
    required String name,
    @JsonKey(name: 'bank_name') required String bankName,
    required int amount, // kobo
    required double percent,
    @JsonKey(name: 'progress_label') String? progressLabel,
  }) = _PayoutCollectionDto;

  factory PayoutCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$PayoutCollectionDtoFromJson(json);
}

/// Wire model for a linked payout bank account.
@freezed
abstract class BankAccountDto with _$BankAccountDto {
  const factory BankAccountDto({
    required String id,
    required String label,
    required String subtitle,
    @JsonKey(name: 'bank_name') required String bankName,
    @JsonKey(name: 'masked_nuban') required String maskedNuban,
  }) = _BankAccountDto;

  factory BankAccountDto.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDtoFromJson(json);
}

/// Wire model for `GET /payouts` — everything the hub renders.
@freezed
abstract class PayoutsHubDto with _$PayoutsHubDto {
  const factory PayoutsHubDto({
    @Default(<PayoutDto>[]) List<PayoutDto> payouts,
    @Default(<PayoutCollectionDto>[]) List<PayoutCollectionDto> collections,
    @JsonKey(name: 'bank_accounts')
    @Default(<BankAccountDto>[])
    List<BankAccountDto> bankAccounts,
    @JsonKey(name: 'total_collected') required int totalCollected, // kobo
    @JsonKey(name: 'mascot_tip') String? mascotTip,
  }) = _PayoutsHubDto;

  factory PayoutsHubDto.fromJson(Map<String, dynamic> json) =>
      _$PayoutsHubDtoFromJson(json);
}
