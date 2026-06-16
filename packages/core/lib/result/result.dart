import 'package:fpdart/fpdart.dart';

import 'package:core/error/failures.dart';

// Curated re-export: only the functional types we use. Re-exporting all of
// fpdart leaks names like `State`/`Reader`/`IO` that collide with Flutter
// (e.g. `State` in StatefulWidget).
export 'package:fpdart/fpdart.dart'
    show Either, Left, Right, Option, Some, None, Unit, unit;

/// The project's functional result type.
///
/// `Result<T>` is a readability alias for `Either<Failure, T>` (fpdart). The
/// left branch is always a domain [Failure]; the right branch is the success
/// value. Construct with `Right(value)` / `Left(failure)` and consume with a
/// positional `fold((failure) {...}, (value) {...})` or an exhaustive `switch`.
///
/// ```dart
/// Future<Result<AuthUser>> login(...) async {
///   if (invalid) return Left(ValidationFailure(...));
///   return Right(user);
/// }
///
/// result.fold(
///   (failure) => emit(state.toError(failure)),
///   (user) => emit(state.toLoaded(user)),
/// );
/// ```
typedef Result<T> = Either<Failure, T>;
