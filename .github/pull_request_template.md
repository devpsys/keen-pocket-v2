# Pull Request

## Summary
<!-- What does this PR do and why? -->

## Related issues
<!-- e.g. Closes #123 -->

## Type of change
- [ ] Feature
- [ ] Bug fix
- [ ] Refactor
- [ ] Docs / chore

---

## Architecture & standards checklist
> A reviewer MUST NOT approve until every box is checked (or marked N/A with a reason).

### Clean Architecture
- [ ] Feature follows the `data / domain / presentation` structure.
- [ ] Dependencies point inward (presentation → domain ← data).
- [ ] Domain has **zero** Flutter imports and contains pure business logic.
- [ ] Presentation talks to a Bloc/Cubit only — no repositories/data-sources in UI.
- [ ] Errors are returned as `Failure` via `Result` — no exceptions leak to presentation.

### Design system & i18n
- [ ] No hardcoded colors (uses `AppColors` / theme).
- [ ] No hardcoded spacing/radius (uses `AppSpacing` / `AppRadius`).
- [ ] No inline `TextStyle` (uses `context.textTheme` / `AppTypography`).
- [ ] No hardcoded user-facing strings (uses `context.l10n`).

### Networking & DI
- [ ] No `Dio()` instantiation outside `core/network`.
- [ ] Dependencies are injected (no manual singletons / no `getIt` in app code).

### Quality
- [ ] Tests added/updated; coverage ≥ 80%.
- [ ] `bash scripts/verify.sh` passes locally (format, analyze, custom_lint, tests).
- [ ] Generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`) are up to date.

## Screenshots / recordings
<!-- For UI changes -->
