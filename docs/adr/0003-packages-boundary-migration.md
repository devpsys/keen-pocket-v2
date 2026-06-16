# ADR 0003 — Migrate `core` and `design_system` into `packages/` (Phase 2)

- **Status:** Accepted (scheduled for Phase 2 — not yet executed)
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
- Requires a melos workspace and import-path updates (`package:keenpockets/core/…`
  → `package:core/…`, `package:design_system/…`).
- Until executed, layering remains enforced by custom_lint only.
