import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_user_dto.dart';

part 'login_response_dto.freezed.dart';
part 'login_response_dto.g.dart';

/// Response body for the login endpoint: tokens + the user payload.
@freezed
abstract class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    required AuthUserDto user,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}
