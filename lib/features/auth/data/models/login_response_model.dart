import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_user_model.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

/// Response body for the login endpoint: tokens + the user payload.
@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    required AuthUserModel user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
