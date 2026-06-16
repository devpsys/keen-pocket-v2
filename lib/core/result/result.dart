import 'package:fpdart/fpdart.dart';

import 'package:keenpockets/core/error/failures.dart';

export 'package:fpdart/fpdart.dart';

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
