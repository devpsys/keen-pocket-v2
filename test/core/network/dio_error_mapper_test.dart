import 'package:core/error/exceptions.dart';
import 'package:core/network/dio_error_mapper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final options = RequestOptions(path: '/x');

  DioException dio(DioExceptionType type, {int? status, Object? data}) =>
      DioException(
        requestOptions: options,
        type: type,
        response: status == null
            ? null
            : Response<dynamic>(
                requestOptions: options,
                statusCode: status,
                data: data,
              ),
      );

  group('DioErrorMapper', () {
    test('timeouts → NetworkException', () {
      for (final t in [
        DioExceptionType.connectionTimeout,
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionError,
        DioExceptionType.badCertificate,
        DioExceptionType.cancel,
      ]) {
        expect(DioErrorMapper.map(dio(t)), isA<NetworkException>());
      }
    });

    test('401/403 → UnauthorizedException', () {
      expect(
        DioErrorMapper.map(dio(DioExceptionType.badResponse, status: 401)),
        isA<UnauthorizedException>(),
      );
      expect(
        DioErrorMapper.map(dio(DioExceptionType.badResponse, status: 403)),
        isA<UnauthorizedException>(),
      );
    });

    test('422 → ValidationException with field errors', () {
      final result = DioErrorMapper.map(
        dio(
          DioExceptionType.badResponse,
          status: 422,
          data: {
            'errors': {
              'email': ['is invalid', 'is taken'],
              'name': 'required',
            },
          },
        ),
      );
      expect(result, isA<ValidationException>());
      final fieldErrors = (result as ValidationException).fieldErrors;
      expect(fieldErrors['email'], 'is invalid, is taken');
      expect(fieldErrors['name'], 'required');
    });

    test('other status → ServerException carrying the code', () {
      final result = DioErrorMapper.map(
        dio(DioExceptionType.badResponse, status: 500),
      );
      expect(result, isA<ServerException>());
      expect((result as ServerException).statusCode, 500);
    });

    test('unknown → ServerException', () {
      expect(
        DioErrorMapper.map(dio(DioExceptionType.unknown)),
        isA<ServerException>(),
      );
    });
  });
}
