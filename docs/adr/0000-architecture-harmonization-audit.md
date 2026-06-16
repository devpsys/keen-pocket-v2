# ADR 0000 — Architecture harmonization with the KeenPocket blueprint

- **Status:** Accepted
- **Date:** 2026-06-16
- **Context source:** `docs/FLUTTER_ARCHITECTURE.md` (official blueprint) audited against the implemented foundation.

## Context

The repository was bootstrapped as a generic, well-governed Clean Architecture
foundation (3 layers + use cases, Bloc, Dio, get_it/injectable, freezed,
go_router, secure storage, ARB l10n, an 8-rule custom_lint package, pre-commit
hooks, CI, 80% coverage gate). The official `FLUTTER_ARCHITECTURE.md` describes
the production, product-specific KeenPocket app (Pocket/Adashi savings domain).

An audit found the **foundations agree**; divergence is in **scope, structure,
and product specifics**, so harmonization is additive evolution, not a rewrite.
Highest-impact gaps: no `packages/` compiler-enforced boundary; no
session/feature-flags/permissions layer; `Result` vs `fpdart`; `App*` vs `Kp*`
branding; `*_model` vs `*_dto` naming; 5 vs the universal-state set.

## Decision

Adopt the blueprint as the target architecture and evolve toward it in phases:

- **Phase 1 (this change set):** low-risk realignment — see ADRs 0001–0004 plus:
  DTO rename, expanded `Failure` hierarchy, expanded universal states +
  `KpAsyncView`, feature barrels + `value_objects/`, flavor entrypoints,
  `config/` + `docs/adr/` + `integration_test/` + `CODEOWNERS`, and a
  cross-feature banned-import lint.
- **Phase 2:** structural — migrate `core`/`design_system` to `packages/` (ADR
  0003), connectivity interceptor + 401-refresh, and the
  `session`/`feature_flags`/`permissions` layer + adaptive nav shell.
- **Phase 3:** product build-out per blueprint Phase 2 (`contributions`,
  `pockets`, `adashi`, `trust`, `money`, `notifications`, …), adopting drift +
  outbox and Firebase behind their triggers.

## Consequences

- The implemented code becomes the blueprint's living realization; every future
  change is reviewed against both.
- Deferred items (drift/offline, Firebase, retrofit, golden tests) are recorded
  as Phase-8 triggers, not omissions.
- Where the implementation refines the blueprint (annotation-based per-feature DI
  instead of manual `_module.dart`; richer custom_lint than the specified
  banned-import lint), the refinement is noted and kept.
