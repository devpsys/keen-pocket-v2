import 'package:dio/dio.dart';

import '../error/exceptions.dart';

/// Translates low-level [DioException]s into the project's [AppException]s.
///
/// Data sources call this so that repositories only ever deal with our own
/// exception hierarchy (which they then map to [Failure]s).
abstract final class DioErrorMapper {
  const DioErrorMapper._();

  static AppException map(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          'Request timed out.',
          cause: error,
          stackTrace: error.stackTrace,
        );
      case DioExceptionType.connectionError:
        return NetworkException(
          'Could not reach the server.',
          cause: error,
          stackTrace: error.stackTrace,
        );
      case DioExceptionType.badCertificate:
        return NetworkException(
          'Insecure connection.',
          cause: error,
          stackTrace: error.stackTrace,
        );
      case DioExceptionType.cancel:
        return NetworkException(
          'Request was cancelled.',
          cause: error,
          stackTrace: error.stackTrace,
        );
      case DioExceptionType.badResponse:
        return _mapStatus(statusCode, error);
      case DioExceptionType.unknown:
        return ServerException(
          'Unexpected network error.',
          statusCode: statusCode,
          cause: error,
          stackTrace: error.stackTrace,
        );
    }
  }

  static AppException _mapStatus(int? statusCode, DioException error) {
    if (statusCode == 401 || statusCode == 403) {
      return UnauthorizedException(
        'Authentication required.',
        cause: error,
        stackTrace: error.stackTrace,
      );
    }
    if (statusCode == 422) {
      return ValidationException(
        'Validation failed.',
        fieldErrors: _extractFieldErrors(error.response?.data),
        cause: error,
        stackTrace: error.stackTrace,
      );
    }
    return ServerException(
      'Server returned an error.',
      statusCode: statusCode,
      cause: error,
      stackTrace: error.stackTrace,
    );
  }

  static Map<String, String> _extractFieldErrors(Object? data) {
    if (data is Map && data['errors'] is Map) {
      final errors = data['errors'] as Map;
      return errors.map(
        (key, value) => MapEntry(
          key.toString(),
          value is List ? value.join(', ') : value.toString(),
        ),
      );
    }
    return const {};
  }
}
