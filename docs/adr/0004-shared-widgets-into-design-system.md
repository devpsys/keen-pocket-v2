# ADR 0004 — Fold `lib/shared/widgets` into the design system

- **Status:** Accepted
- **Date:** 2026-06-16
- **Supersedes:** the earlier decision to keep a top-level `lib/shared/`.

## Context

The bootstrap placed reusable cross-feature views (`AppLoadingView`,
`AppErrorView`, `AppEmptyView`) under `lib/shared/widgets`. The blueprint has
**no `lib/shared`**: reusable atoms/molecules live in the design system, and the
universal async states are rendered by a single `KpAsyncView`.

An earlier conversation chose to keep `shared/`; this ADR reverses that to align
with the blueprint, which is the authoritative reference.

## Decision

Remove `lib/shared/`. Move the views into `design_system/widgets` as `Kp*`
components and add `KpAsyncView` (renders the universal loading / empty / failure
/ permission-denied / feature-disabled states) and `KpComingSoonCard` (for
flag-OFF features).

## Consequences

- One home for reusable UI (the design system); no ambiguous `shared/` bucket.
- Pages render states via `KpAsyncView` instead of hand-wiring individual views.
- If a genuinely non-design, cross-feature widget appears later, it belongs to
  the consuming feature or a shared *feature*, not a `shared/` catch-all.
