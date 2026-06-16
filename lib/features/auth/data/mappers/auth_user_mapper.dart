import 'package:keenpockets/features/auth/data/models/auth_user_model.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';

/// Translates between the data model and the domain entity.
///
/// Mappers keep the domain layer ignorant of serialization concerns and give us
/// one place to evolve the wire format without touching business logic.
extension AuthUserModelMapper on AuthUserModel {
  AuthUser toEntity() => AuthUser(id: id, email: email, name: name);
}

extension AuthUserEntityMapper on AuthUser {
  AuthUserModel toModel() => AuthUserModel(id: id, email: email, name: name);
}
