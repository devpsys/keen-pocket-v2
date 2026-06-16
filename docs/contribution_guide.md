# Contribution Guide

## One-time setup
```bash
flutter pub get
bash scripts/install_hooks.sh     # enables the pre-commit gate
bash scripts/generate.sh          # codegen + l10n
```

## Day-to-day
```bash
bash scripts/watch.sh             # keep codegen running while you work
# ...make changes...
bash scripts/verify.sh            # format + analyze + custom_lint + tests
```

## Branching & commits
- Branch from `develop`: `feature/<scope>`, `fix/<scope>`, `chore/<scope>`.
- Keep commits focused; the pre-commit hook runs format, analyze, custom_lint
  and tests — a failing check blocks the commit.

## Opening a PR
- Target `develop` (or `main` for releases).
- Fill in **every** box in the PR template (`.github/pull_request_template.md`).
- CI must be green: format, analyze (app + linter package), custom_lint, tests,
  coverage ≥ 80%, Android & iOS builds.
- A PR **cannot be approved** until all architecture checklist items pass.

## The rules (all machine-enforced — see [architecture.md](architecture.md))
1. Clean Architecture layering; dependencies point inward.
2. Domain is Flutter-free and pure.
3. UI ↔ Bloc only; no repositories/data sources in widgets.
4. Errors via `Result`/`Failure`; no exceptions in presentation.
5. Design tokens for all colors/spacing/radius/typography.
6. All user-facing text localized via `context.l10n`.
7. One injected `Dio`; DI by constructor, not service location.
8. Tests for every change; coverage ≥ 80%.

## Adding/standardizing a library
New dependencies require justification in the PR description and an update to
the relevant guide. Prefer the approved stack (Bloc, Dio, Freezed,
json_serializable, GetIt/Injectable, secure storage, go_router).

## Adding an architecture rule
Extend `packages/architecture_linter` (see its README), register the rule, and
document it in `architecture.md`.
