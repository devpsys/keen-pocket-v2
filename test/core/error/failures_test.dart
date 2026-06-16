import 'package:core/error/exceptions.dart';
import 'package:core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure', () {
    test('default messages are set per type', () {
      expect(const NetworkFailure().message, isNotEmpty);
      expect(const ServerFailure(statusCode: 500).statusCode, 500);
      expect(const CacheFailure().message, isNotEmpty);
      expect(
        const ValidationFailure(fieldErrors: {'a': 'b'}).fieldErrors['a'],
        'b',
      );
      expect(const AuthFailure().message, isNotEmpty);
      expect(const UnexpectedFailure().message, isNotEmpty);
    });

    test('equality is by runtimeType + message', () {
      expect(const NetworkFailure(), const NetworkFailure());
      expect(
        const NetworkFailure(message: 'a'),
        isNot(const NetworkFailure(message: 'b')),
      );
      expect(const NetworkFailure(), isNot(const ServerFailure()));
    });

    test('toString includes type and message', () {
      expect(const ServerFailure().toString(), contains('ServerFailure'));
    });
  });

  group('AppException', () {
    test('carry message and metadata', () {
      expect(const ServerException('x', statusCode: 503).statusCode, 503);
      expect(const NetworkException('x').message, 'x');
      expect(const UnauthorizedException('x').toString(), contains('x'));
      expect(
        const ValidationException(
          'x',
          fieldErrors: {'k': 'v'},
        ).fieldErrors['k'],
        'v',
      );
      expect(const CacheException('x').message, 'x');
    });
  });
}
