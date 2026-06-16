# Design System Guide

Everything visual comes from tokens in the **`design_system` package**
(`packages/design_system/lib/`). Raw colors/spacing/radius and inline
`TextStyle`s are forbidden in widgets.

## Brand identity

KeenPocket's look is **"Duolingo energy" — playful, tactile, chunky**. Surfaces
are crisp white cards floating on a soft slate background; depth comes from
**physical layering** (thick flat-color bottom borders) rather than blurry
shadows. The mascot **Mr K** guides the user's emotional journey.

- **Primary** `#1cb0f6` (sky blue) — main actions, Mr K's colour.
- **Dark** `#1899d6` — candy-button bottom borders / pressed states.
- **Secondary** `#ffd900` (gold) — rewards, Keens currency, milestones.
- **Type** Nunito, weights 800–900 for headlines (the "chunky" hierarchy),
  600 for body (no thin text), uppercase tracked labels for actions/nav.
- **Dark mode** shifts to a deep navy (bg `#141e2a`, surfaces `#202f3e`).

## Tokens

| Token group | File | Access in widgets |
|-------------|------|-------------------|
| Colors (palette + surface ramp + navy) | `colors/kp_colors.dart` | via theme — `context.colorScheme.primary` |
| Semantic colors | `themes/kp_semantic_colors.dart` | `context.colors.success` |
| Typography | `typography/kp_typography.dart` | `context.textTheme.bodyMedium`; `KpTypography.navButton` / `labelCaps` for uppercase actions/overlines |
| Spacing | `spacing/kp_spacing.dart` | `KpSpacing.m`, `const Gap.m()` |
| Radius | `radius/kp_radii.dart` | `KpRadii.allM` (controls), `allXl` (cards), `topSheet` (sheets) |
| Shadows/Elevation | `shadows/kp_shadows.dart` | `KpShadows.medium`, `brandGlow`, `modal` |
| Gradients | `gradients/kp_gradients.dart` | `KpGradients.card` (financial-card wash) |

Import everything via the barrel: `import 'package:design_system/design_system.dart';`

## Components

| Widget | Use |
|--------|-----|
| `KpButton` | The 3D "candy" button. Variants: `primary` (blue), `secondary` (gold), `ghost` (flat outline). `caps: true` for uppercase nav-button labels. Handles loading + icon internally. |
| `KpCard` | Chunky card — `xl` radius, 2px top/side + 7px bottom border. `KpCard.financial` (gradient), `KpCard.interactive` (tappable; border turns brand on press/select). |
| `KpMascot` | Mr K. `KpMascot.celebrate / .search / .think / ()` map to mood; art is shared today, API is stable. |
| `KpTextField` | Themed input — thick 2px border, brand-glow focus, uppercase `label-caps` label. |
| `KpAsyncView` / `KpEmptyView` / `KpErrorView` / `KpLoadingView` / `KpComingSoonCard` / `KpOfflineBanner` | Universal state surfaces. |

Category icons follow an **emoji-first** convention (🏠 Rent, 🛒 Groceries) paired
with a text label for accessibility.

## Theming
`KpTheme.light` / `KpTheme.dark` assemble Material 3 `ThemeData` from the
tokens, including a `ColorScheme` (gold secondary, surface tonal ramp), a
heavier `TextTheme`, input/button/card/sheet/dialog themes and the
`KpSemanticColors` `ThemeExtension`. `MaterialApp` uses `ThemeMode.system`.

## Responsive sizing
`context.responsive(compact: ..., medium: ..., expanded: ...)` plus
`context.isCompact / isMedium / isExpanded` (breakpoints 600 / 1024).

## ✅ Correct
```dart
Container(
  padding: const EdgeInsets.all(KpSpacing.m),
  decoration: BoxDecoration(
    color: context.colorScheme.surfaceContainerHighest,
    borderRadius: KpRadii.allL,
    boxShadow: KpShadows.low,
  ),
  child: Text('x', style: context.textTheme.titleMedium),
);
const Gap.l();                  // instead of SizedBox(height: 24)
```

## ❌ Incorrect (each rejected by custom_lint)
```dart
Color(0xFF2196F3)               // no_hardcoded_colors
Colors.blue                     // no_hardcoded_colors
SizedBox(height: 12)            // no_arbitrary_spacing
EdgeInsets.all(16)              // no_arbitrary_spacing
TextStyle(fontSize: 16)         // use context.textTheme instead
```

## Adding a new token
1. Add the raw value to the appropriate token file (the only place literals are
   allowed — the `design_system` package is lint-exempt).
2. Expose it semantically (theme, `KpSemanticColors`, or a token getter).
3. Reference it from widgets via the theme/extension — never the raw palette.
