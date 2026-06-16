import 'package:keenpockets/core/error/failures.dart';

/// A typed, exhaustive result of an operation that may fail.
///
/// This is the project's functional error-handling primitive (chosen over
/// `dartz`/`Either` to stay dependency-free and leverage Dart 3 sealed classes).
/// Use cases and repositories return `Result<T>`; presentation handles both
/// branches via [fold] or a `switch`.
///
/// ```dart
/// final result = await loginUseCase(params);
/// result.fold(
///   onFailure: (f) => emit(state.toError(f)),
///   onSuccess: (user) => emit(state.toLoaded(user)),
/// );
/// ```
sealed class Result<T> {
  const Result();

  /// Creates a successful result wrapping [value].
  const factory Result.success(T value) = Success<T>;

  /// Creates a failed result wrapping [failure].
  const factory Result.failure(Failure failure) = ResultFailure<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is ResultFailure<T>;

  /// The value if successful, otherwise `null`.
  T? get valueOrNull => switch (this) {
    Success<T>(:final value) => value,
    ResultFailure<T>() => null,
  };

  /// The failure if failed, otherwise `null`.
  Failure? get failureOrNull => switch (this) {
    Success<T>() => null,
    ResultFailure<T>(:final failure) => failure,
  };

  /// Collapses both branches into a single value of type [R].
  R fold<R>({
    required R Function(Failure failure) onFailure,
    required R Function(T value) onSuccess,
  }) => switch (this) {
    Success<T>(:final value) => onSuccess(value),
    ResultFailure<T>(:final failure) => onFailure(failure),
  };

  /// Maps the success value, leaving a failure untouched.
  Result<R> map<R>(R Function(T value) transform) => switch (this) {
    Success<T>(:final value) => Success<R>(transform(value)),
    ResultFailure<T>(:final failure) => ResultFailure<R>(failure),
  };

  /// Chains another fallible operation onto a success.
  Result<R> flatMap<R>(Result<R> Function(T value) transform) => switch (this) {
    Success<T>(:final value) => transform(value),
    ResultFailure<T>(:final failure) => ResultFailure<R>(failure),
  };
}

/// The success branch of a [Result].
final class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success<T> && other.value == value;

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() => 'Success($value)';
}

/// The failure branch of a [Result].
final class ResultFailure<T> extends Result<T> {
  const ResultFailure(this.failure);
  final Failure failure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultFailure<T> && other.failure == failure;

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() => 'ResultFailure($failure)';
}
