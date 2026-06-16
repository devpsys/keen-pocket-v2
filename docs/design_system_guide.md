# Design System Guide

Everything visual comes from tokens in `lib/core/design_system/`. Raw
colors/spacing/radius and inline `TextStyle`s are forbidden in widgets.

## Tokens

| Token group | File | Access in widgets |
|-------------|------|-------------------|
| Colors (palette) | `colors/app_colors.dart` | via theme — `context.colorScheme.primary` |
| Semantic colors | `themes/app_semantic_colors.dart` | `context.colors.success` |
| Typography | `typography/app_typography.dart` | `context.textTheme.bodyMedium` |
| Spacing | `spacing/app_spacing.dart` | `AppSpacing.m`, `const Gap.m()` |
| Radius | `radius/app_radius.dart` | `AppRadius.allM` |
| Shadows/Elevation | `shadows/app_shadows.dart` | `AppShadows.medium` |

Import everything via the barrel: `import '.../core/design_system/design_system.dart';`

## Theming
`AppTheme.light` / `AppTheme.dark` assemble Material 3 `ThemeData` from the
tokens, including a `ColorScheme`, `TextTheme`, input/button/card themes and the
`AppSemanticColors` `ThemeExtension`. `MaterialApp` uses `ThemeMode.system`.

## Responsive sizing
`context.responsive(compact: ..., medium: ..., expanded: ...)` plus
`context.isCompact / isMedium / isExpanded` (breakpoints 600 / 1024).

## ✅ Correct
```dart
Container(
  padding: const EdgeInsets.all(AppSpacing.m),
  decoration: BoxDecoration(
    color: context.colorScheme.surfaceContainerHighest,
    borderRadius: AppRadius.allL,
    boxShadow: AppShadows.low,
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
   allowed — `core/design_system` is lint-exempt).
2. Expose it semantically (theme, `AppSemanticColors`, or a token getter).
3. Reference it from widgets via the theme/extension — never the raw palette.
