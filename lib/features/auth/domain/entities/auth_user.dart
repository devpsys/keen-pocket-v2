import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

/// Domain entity representing an authenticated user.
///
/// Pure business object: no Flutter, no JSON, no persistence concerns. Data
/// models map TO this; presentation reads FROM this.
@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    required String email,
    required String name,
  }) = _AuthUser;
}
