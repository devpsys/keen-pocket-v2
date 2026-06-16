# Architecture Overview

KeenPockets is built on **Feature-Based Clean Architecture**. Every feature is a
vertical slice with three layers, and dependencies always point *inward*.

```
presentation  ─depends on→  domain  ←depends on─  data
   (UI, Bloc)               (pure)                (API, cache)
```

## Directory layout

```
packages/                       # in-repo packages (compiler-enforced boundaries)
├── core/                        # PURE Dart kernel (fpdart + dio only; no Flutter, no DI)
│   └── lib/{result,error,usecase,network/dio_error_mapper,presentation/state_status}
├── design_system/               # Flutter UI kit (depends on core): Kp* tokens/themes/widgets
└── architecture_linter/         # custom_lint rules enforcing this document

lib/
├── main.dart · main_{dev,staging,prod}.dart · bootstrap.dart   # entrypoints + startup
├── app/                     # Composition root: router, MaterialApp
├── core/                    # App-aware cross-cutting glue (injectable lives here)
│   ├── config/              # AppConfig / flavors
│   ├── di/                  # GetIt + Injectable wiring
│   ├── error/               # failure_localizer (Failure → l10n)
│   ├── feature_flags/       # FeatureFlagService, Feature keys, FeatureGuard
│   ├── localization/        # ARB files + generated AppLocalizations
│   ├── network/             # Single Dio module, interceptors, connectivity
│   ├── permissions/         # AccessPolicy (global, role-derived)
│   ├── session/             # SessionManager, SessionUser, AuthStatus
│   ├── storage/             # Secure token storage + TokenRefresher
│   └── widgets/             # Adaptive nav shell
└── features/<feature>/
    ├── <feature>.dart       # public barrel
    ├── data/{datasources,dtos,mappers,repositories}
    ├── domain/{entities,value_objects,repositories,services,usecases}
    └── presentation/{bloc,pages,widgets}   # bloc/ holds bloc + events + state
```

**Dependency direction (compiler-enforced):** `features → packages` and
`design_system → core`, never the reverse (a package cannot import the app).
The pure kernel lives in `packages/core`; injectable/app-aware glue stays in
`lib/core` (see ADR 0003).

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
