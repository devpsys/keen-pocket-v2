# Architecture Overview

KeenPockets is built on **Feature-Based Clean Architecture**. Every feature is a
vertical slice with three layers, and dependencies always point *inward*.

```
presentation  ─depends on→  domain  ←depends on─  data
   (UI, Bloc)               (pure)                (API, cache)
```

## Directory layout

```
lib/
├── app/                     # Composition root: bootstrap, router, MaterialApp
├── core/                    # Cross-cutting infrastructure (no feature logic)
│   ├── config/              # AppConfig / flavors
│   ├── design_system/       # Tokens, themes, design-system widgets
│   ├── di/                  # GetIt + Injectable wiring
│   ├── error/               # Failure + Exception hierarchies
│   ├── localization/        # ARB files + generated AppLocalizations
│   ├── network/             # Single Dio, interceptors, error mapper
│   ├── presentation/        # Shared presentation primitives (StateStatus)
│   ├── result/              # Result<T> functional error type
│   ├── storage/             # Secure token storage
│   └── usecase/             # UseCase base contracts
├── shared/                  # Reusable cross-feature widgets
├── features/<feature>/
│   ├── data/{datasources,models,mappers,repositories}
│   ├── domain/{entities,repositories,usecases}
│   └── presentation/{bloc,pages,widgets}   # bloc/ holds bloc + events + state
└── main.dart
packages/architecture_linter # custom_lint rules enforcing this document
```

## Layer rules (machine-enforced)

| Rule | Enforced by |
|------|-------------|
| Presentation must not depend on Data | `no_data_layer_import_in_presentation` |
| Presentation must not touch repositories | `no_repository_in_ui` |
| Data implements Domain contracts | code review + DI registration |
| Domain has **zero** Flutter imports | code review (domain imports only `freezed_annotation`, `injectable`, core) |
| Only data/network may call HTTP | `no_direct_http_in_ui`, `no_new_dio_instance` |
| No exception leaks to presentation | repositories return `Result<Failure, T>` |

## The dependency flow of a request

```
Widget → Bloc → UseCase → Repository(domain) 
                                  ▲
        Repository(data) ─────────┘  implements
            → RemoteDataSource (Dio) → DioErrorMapper → AppException
            → LocalDataSource (secure storage / prefs)
        Repository(data) maps AppException → Failure → Result
```

1. **Widget** dispatches an **event** to a **Bloc**.
2. **Bloc** calls a **UseCase** (pure business operation).
3. **UseCase** calls a **Repository** *interface* (domain).
4. The **Repository implementation** (data) calls data sources, catches
   `AppException`s and maps them to `Failure`s, returning a `Result`.
5. **Bloc** folds the `Result` into a new immutable **state**.
6. **Widget** rebuilds from state and renders loading/success/empty/error.

## Error handling

- **Exceptions** (`core/error/exceptions.dart`) are thrown only inside data
  sources and caught only inside repository implementations.
- **Failures** (`core/error/failures.dart`) are the domain-facing error model.
- **Result** (`core/result/result.dart`) is the return type for anything fallible.
- Presentation localizes failures via `failure.localizedMessage(context)`.

## Dependency Injection

- `get_it` + `injectable`. Run `dart run build_runner build` to regenerate
  `injection.config.dart`.
- `@LazySingleton(as: X)` for stateless services/repositories/data sources.
- `@injectable` for use cases and Blocs (new instance per resolve).
- Third-party singletons (`Dio`, `Connectivity`, secure storage,
  `SharedPreferences`) live in `core/network/network_module.dart`.
- `getIt` is used **only** in composition roots (DI, route builders). App code
  receives dependencies by constructor injection.

See the focused guides: [feature creation](feature_creation_guide.md) ·
[state management](state_management_guide.md) · [design system](design_system_guide.md) ·
[localization](localization_guide.md) · [networking](networking_guide.md) ·
[testing](testing_guide.md) · [contributing](contribution_guide.md).
