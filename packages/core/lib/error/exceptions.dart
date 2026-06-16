/// Data-layer exceptions.
///
/// These are thrown by data sources (remote/local) and caught by repository
/// implementations, which translate them into [Failure]s. They MUST NOT be
/// imported by the domain or presentation layers.
library;

/// Base class for all data-layer exceptions.
sealed class AppException implements Exception {
  const AppException(this.message, {this.cause, this.stackTrace});

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when the server returns a non-success status code.
final class ServerException extends AppException {
  const ServerException(
    super.message, {
    this.statusCode,
    super.cause,
    super.stackTrace,
  });

  final int? statusCode;
}

/// Thrown when a network request cannot complete (timeout, offline, DNS).
final class NetworkException extends AppException {
  const NetworkException(super.message, {super.cause, super.stackTrace});
}

/// Thrown when a 401/403 is received.
final class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message, {super.cause, super.stackTrace});
}

/// Thrown when local persistence fails.
final class CacheException extends AppException {
  const CacheException(super.message, {super.cause, super.stackTrace});
}

/// Thrown when server-side validation fails (typically a 422).
final class ValidationException extends AppException {
  const ValidationException(
    super.message, {
    this.fieldErrors = const {},
    super.cause,
    super.stackTrace,
  });

  final Map<String, String> fieldErrors;
}
