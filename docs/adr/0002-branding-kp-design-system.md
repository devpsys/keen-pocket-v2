# ADR 0002 — Brand the design system as `Kp*` (Nunito, `#1cb0f6`)

- **Status:** Accepted
- **Date:** 2026-06-16

## Context

The bootstrap shipped a generic design system (`AppColors`, `AppSpacing`,
`AppButton`, …) on Roboto with brand `#3183F3`. The blueprint and design library
specify the real KeenPocket brand: `Kp*` token/component names, **Nunito**
typeface, brand `#1cb0f6` (dark `#1899d6`, light `#ddf4ff`, gold `#ffd900`),
"candy" buttons, chunky cards, Mr K mascot.

## Decision

Rename the design-system surface to the `Kp*` convention and adopt the brand:

- Tokens: `KpColors`, `KpTypography`, `KpSpacing`, `KpRadii`, `KpShadows`,
  `KpElevation`, `KpSemanticColors`; theme `KpTheme`.
- Components: `KpButton`, `KpTextField`, and the folded async/empty/error views
  (`KpAsyncView`, `KpEmptyState`, `KpErrorView`, `KpLoadingView`,
  `KpComingSoonCard`).
- Font family **Nunito**; brand color `#1cb0f6`.
- Custom-lint messages updated to reference the `Kp*` tokens.

## Consequences

- All design-token consumers were updated to `Kp*` / `context.*` accessors.
- Font assets (Nunito) and Mr K imagery are a follow-up asset task; the family is
  wired now so bundling the font later is a drop-in.
- `context.colors` / `context.textTheme` ergonomics are unchanged.
