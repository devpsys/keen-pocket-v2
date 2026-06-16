# ADR 0003 — Migrate `core` and `design_system` into `packages/` (Phase 2)

- **Status:** Accepted — executed in Phase 2 (2026-06-16)
- **Date:** 2026-06-16

## Context

The blueprint (Phase 3) places truly shared infrastructure in **separate in-repo
Dart packages** (`packages/core`, `packages/design_system`) so the dependency
direction `features → packages` is enforced **by the compiler**, not convention.
Today these live in `lib/core`, enforced only by the custom layering lints.

## Decision

Migrate the **pure** parts of `lib/core` (`result`/fpdart wiring, `error`,
`usecase`, `network`, generic extensions) into `packages/core`, and the design
system into `packages/design_system`. Keep **app-aware glue** (session, feature
flags, permissions, adaptive shell — added in Phase 2) in `lib/core`. Manage the
workspace with **melos**.

This is recorded now but executed in **Phase 2**, immediately after the Phase 1
realignment, while the codebase is still small and the move is cheap.

## Consequences

- Compiler-enforced boundaries for the highest-churn shared code; clean path to
  later promoting features to their own packages (Phase-8 triggers).
- Import paths updated (`package:keenpockets/core/…` → `package:core/…`,
  `package:design_system/…`); `melos.yaml` added for the workspace.

## Refinement made during execution

To avoid cross-package `injectable` codegen, `packages/core` holds only the
**pure kernel** (no Flutter, no DI, no codegen): `Result`/fpdart alias, `Failure`
& `AppException` hierarchies, `UseCase`, `DioErrorMapper`, `StateStatus`. It
depends only on `fpdart` + `dio`. `packages/design_system` is a Flutter package
depending on `core` (for `StateStatus` in `KpAsyncView`).

All **injectable/app-aware glue stays in `lib/core`**: the Dio network module +
interceptors, connectivity checker, secure storage, config, DI composition,
localization, plus the new `session`/`feature_flags`/`permissions` layer and the
adaptive nav shell. This keeps a single app-level `injectable` config while
still giving features a compiler-enforced pure dependency.
