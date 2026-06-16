import 'package:keenpockets/features/auth/data/dtos/auth_user_dto.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';

/// Translates between the data model and the domain entity.
///
/// Mappers keep the domain layer ignorant of serialization concerns and give us
/// one place to evolve the wire format without touching business logic.
extension AuthUserDtoMapper on AuthUserDto {
  AuthUser toEntity() => AuthUser(id: id, email: email, name: name);
}

extension AuthUserEntityMapper on AuthUser {
  AuthUserDto toDto() => AuthUserDto(id: id, email: email, name: name);
}
