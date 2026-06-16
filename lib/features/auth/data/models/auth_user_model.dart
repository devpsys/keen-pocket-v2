import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

/// Wire/persistence representation of a user. Mapped to the `AuthUser` domain
/// entity by `AuthUserMapper` — the domain never sees this type.
@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') required String name,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}
