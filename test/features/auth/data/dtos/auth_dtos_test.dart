import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/auth/data/dtos/auth_user_dto.dart';
import 'package:keenpockets/features/auth/data/dtos/login_request_dto.dart';
import 'package:keenpockets/features/auth/data/dtos/login_response_dto.dart';
import 'package:keenpockets/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:keenpockets/features/auth/domain/entities/auth_user.dart';

void main() {
  group('AuthUserDto JSON', () {
    test('fromJson maps full_name → name', () {
      final model = AuthUserDto.fromJson({
        'id': '1',
        'email': 'a@b.com',
        'full_name': 'Ada',
      });
      expect(model.name, 'Ada');
      expect(model.toJson()['full_name'], 'Ada');
    });
  });

  group('LoginResponseDto JSON', () {
    test('parses nested user + tokens', () {
      final model = LoginResponseDto.fromJson({
        'access_token': 'at',
        'refresh_token': 'rt',
        'user': {'id': '1', 'email': 'a@b.com', 'full_name': 'Ada'},
      });
      expect(model.accessToken, 'at');
      expect(model.refreshToken, 'rt');
      expect(model.user.name, 'Ada');
    });
  });

  group('LoginRequestDto JSON', () {
    test('serializes credentials', () {
      const req = LoginRequestDto(email: 'a@b.com', password: 'pw');
      expect(req.toJson(), {'email': 'a@b.com', 'password': 'pw'});
    });
  });

  group('AuthUserMapper', () {
    test('model ⇄ entity round-trips', () {
      const model = AuthUserDto(id: '1', email: 'a@b.com', name: 'Ada');
      final entity = model.toEntity();
      expect(entity, isA<AuthUser>());
      expect(entity.name, 'Ada');
      expect(entity.toDto(), model);
    });
  });
}
