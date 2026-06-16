# architecture_linter

Custom `custom_lint` rules that enforce keenpockets' Clean Architecture and
design-system conventions at analysis time (IDE + CI + pre-commit).

## Rules

| Rule | Severity | What it rejects |
|------|----------|-----------------|
| `no_hardcoded_strings` | error | `Text('Login')` — use `context.l10n.*` |
| `no_hardcoded_colors` | error | `Color(0x...)`, `Colors.*` — use `AppColors` / theme |
| `no_arbitrary_spacing` | error | `SizedBox(height: 12)`, `EdgeInsets.all(16)` — use `AppSpacing` |
| `no_repository_in_ui` | error | `*Repository` referenced in `presentation/` |
| `no_data_layer_import_in_presentation` | error | importing `data/` from `presentation/` |
| `no_direct_http_in_ui` | error | importing `dio`/`http` outside data/network layers |
| `no_new_dio_instance` | error | `Dio()` outside `core/network` |
| `no_business_logic_in_build` | warning | loops / local functions / try-catch in `build()` |

## Exemptions
- Generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`, `/generated/`).
- `core/design_system/**` is exempt from token rules (it *defines* the tokens).
- `core/network/**` and `**/datasources/**` may construct `Dio` / use HTTP.

## Usage
The host app enables the plugin via `analysis_options.yaml`:

```yaml
analyzer:
  plugins:
    - custom_lint
```

Run on demand: `dart run custom_lint`.

## Adding a rule
1. Create `lib/src/rules/<rule>.dart` extending `DartLintRule`.
2. Register it in `lib/architecture_linter.dart` → `getLintRules`.
3. Add a row to the table above and document it in `docs/architecture.md`.
