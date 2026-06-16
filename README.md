# KeenPockets

Production-grade Flutter foundation built on **Feature-Based Clean Architecture**
with architectural compliance enforced automatically (custom lints + git hooks +
CI), not by developer discipline.

## Stack
Bloc/Cubit · Dio · Freezed · json_serializable · GetIt + Injectable ·
Result pattern · flutter_secure_storage · SharedPreferences · go_router · ARB l10n.

## Quick start
```bash
flutter pub get
bash scripts/install_hooks.sh        # enable pre-commit gate
bash scripts/generate.sh             # freezed / json / injectable / l10n
flutter run
```

## Everyday commands
```bash
make gen        # code generation
make watch      # continuous codegen
make verify     # format + analyze + custom_lint + tests (mirrors CI)
make coverage   # tests + 80% coverage gate
dart run custom_lint   # architecture rules only
```

## Project layout
```
lib/app/        composition root (bootstrap, router, MaterialApp)
lib/core/       config, design_system, di, error, localization, network, result, usecase
lib/shared/     reusable cross-feature widgets
lib/features/   vertical slices (data / domain / presentation) — see `auth`
packages/architecture_linter/   custom_lint rules enforcing the architecture
```

## Architecture enforcement
Eight custom lint rules block violations at IDE / commit / CI time:
`no_hardcoded_strings`, `no_hardcoded_colors`, `no_arbitrary_spacing`,
`no_repository_in_ui`, `no_data_layer_import_in_presentation`,
`no_direct_http_in_ui`, `no_new_dio_instance`, `no_business_logic_in_build`.
Pre-commit runs format + analyze + custom_lint + tests; CI adds coverage and
Android/iOS builds.

## Documentation
- [Architecture Overview](docs/architecture.md)
- [Feature Creation Guide](docs/feature_creation_guide.md)
- [State Management Guide](docs/state_management_guide.md)
- [Design System Guide](docs/design_system_guide.md)
- [Localization Guide](docs/localization_guide.md)
- [Networking Guide](docs/networking_guide.md)
- [Testing Guide](docs/testing_guide.md)
- [Contribution Guide](docs/contribution_guide.md)

## Sample feature
`lib/features/auth` demonstrates every standard end-to-end: domain
(entities/usecases/repo interface), data (models/datasources/mappers/repo impl,
exception→failure mapping), presentation (Bloc + Freezed state + page/widgets),
DI registration, localization, design-system usage, and a full test suite.
