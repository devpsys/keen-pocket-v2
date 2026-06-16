import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_dto.freezed.dart';
part 'auth_user_dto.g.dart';

/// Wire/persistence representation of a user. Mapped to the `AuthUser` domain
/// entity by `AuthUserMapper` — the domain never sees this type.
@freezed
abstract class AuthUserDto with _$AuthUserDto {
  const factory AuthUserDto({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') required String name,
  }) = _AuthUserDto;

  factory AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);
}
