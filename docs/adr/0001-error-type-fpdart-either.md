# ADR 0001 — Standardize on fpdart `Either` for error handling

- **Status:** Accepted
- **Date:** 2026-06-16
- **Supersedes:** the custom `sealed Result<T>` introduced at bootstrap.

## Context

The bootstrap used a custom Dart 3 `sealed Result<T>` (Success/ResultFailure).
The blueprint (`FLUTTER_ARCHITECTURE.md` Phase 5/6) mandates `Either<Failure, T>`
via **fpdart**. The custom type is isomorphic to `Either`, so the difference is
vocabulary and ecosystem familiarity, not capability.

## Decision

Adopt **fpdart** as the functional core. Use `Either<Failure, T>` end-to-end:

- A readability alias is kept: `typedef Result<T> = Either<Failure, T>;` so
  signatures read `Future<Result<AuthUser>>` while being real fpdart `Either`.
- Construct with `Right(value)` / `Left(failure)`.
- Consume with positional `fold((failure) {...}, (value) {...})` (left = failure,
  right = success), or exhaustive `switch`.
- Use cases: `Future<Either<Failure, T>> call(Params)`.

## Consequences

- Adds the `fpdart` dependency; gains `Either`, `Option`, `TaskEither` and the
  conventional team vocabulary the blueprint reviews against.
- Migration was mechanical (constructors + fold call sites + tests).
- `lib/core/result/result.dart` now re-exports fpdart and defines the `Result`
  alias rather than its own sealed class.
