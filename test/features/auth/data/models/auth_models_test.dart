import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:keenpockets/features/auth/data/models/auth_user_model.dart';
import 'package:keenpockets/features/auth/data/models/login_request_model.dart';
import 'package:keenpockets/features/auth/data/models/login_response_model.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';

void main() {
  group('AuthUserModel JSON', () {
    test('fromJson maps full_name → name', () {
      final model = AuthUserModel.fromJson({
        'id': '1',
        'email': 'a@b.com',
        'full_name': 'Ada',
      });
      expect(model.name, 'Ada');
      expect(model.toJson()['full_name'], 'Ada');
    });
  });

  group('LoginResponseModel JSON', () {
    test('parses nested user + tokens', () {
      final model = LoginResponseModel.fromJson({
        'access_token': 'at',
        'refresh_token': 'rt',
        'user': {'id': '1', 'email': 'a@b.com', 'full_name': 'Ada'},
      });
      expect(model.accessToken, 'at');
      expect(model.refreshToken, 'rt');
      expect(model.user.name, 'Ada');
    });
  });

  group('LoginRequestModel JSON', () {
    test('serializes credentials', () {
      const req = LoginRequestModel(email: 'a@b.com', password: 'pw');
      expect(req.toJson(), {'email': 'a@b.com', 'password': 'pw'});
    });
  });

  group('AuthUserMapper', () {
    test('model ⇄ entity round-trips', () {
      const model = AuthUserModel(id: '1', email: 'a@b.com', name: 'Ada');
      final entity = model.toEntity();
      expect(entity, isA<AuthUser>());
      expect(entity.name, 'Ada');
      expect(entity.toModel(), model);
    });
  });
}
