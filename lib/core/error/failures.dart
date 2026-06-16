/// Unified failure model for the entire application.
///
/// Failures are the *domain-facing* representation of something going wrong.
/// Exceptions (see `exceptions.dart`) are thrown at the data-source boundary and
/// MUST be mapped into [Failure]s before crossing into the domain layer. No raw
/// exception should ever leak into presentation.
library;

/// Base type for all recoverable error states.
///
/// Implemented as a `sealed` class so that callers can exhaustively `switch`
/// over every failure kind without a default branch.
sealed class Failure {
  const Failure({required this.message, this.cause, this.stackTrace});

  /// Human-meaningful, *non-localized* description. Presentation should map this
  /// to a localized string via `context.l10n` rather than showing it directly.
  final String message;

  /// The original error that triggered this failure, if any.
  final Object? cause;

  /// The stack trace captured when the failure was created, if any.
  final StackTrace? stackTrace;

  @override
  String toString() => '$runtimeType(message: $message, cause: $cause)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => Object.hash(runtimeType, message);
}

/// Network-level failure (no connectivity, timeout, DNS, etc.).
final class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection.',
    super.cause,
    super.stackTrace,
  });
}

/// The server responded with an error status code (5xx, or a handled 4xx).
final class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Something went wrong on our end.',
    this.statusCode,
    super.cause,
    super.stackTrace,
  });

  final int? statusCode;
}

/// Local cache/persistence read or write failed.
final class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Could not read local data.',
    super.cause,
    super.stackTrace,
  });
}

/// Input or business-rule validation failed.
final class ValidationFailure extends Failure {
  const ValidationFailure({
    super.message = 'The provided data is invalid.',
    this.fieldErrors = const {},
    super.cause,
    super.stackTrace,
  });

  /// Optional per-field error map (e.g. `{'email': 'Invalid email'}`).
  final Map<String, String> fieldErrors;
}

/// Authentication is required or the session expired (401/403).
final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message = 'Your session has expired. Please sign in again.',
    super.cause,
    super.stackTrace,
  });
}

/// A catch-all for genuinely unexpected, unclassified errors.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    super.message = 'An unexpected error occurred.',
    super.cause,
    super.stackTrace,
  });
}
