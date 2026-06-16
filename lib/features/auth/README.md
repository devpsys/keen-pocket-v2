# Feature: `auth`

Get a trusted, authenticated session (login + token lifecycle). Reference
implementation for the standard feature layout.

## Layout
```
auth/
├── auth.dart                 # public barrel (import this from other features)
├── data/
│   ├── datasources/          # remote (Dio) + local (secure storage / prefs)
│   ├── dtos/                 # *_dto.dart (freezed + json_serializable)
│   ├── mappers/              # DTO ⇄ Entity
│   └── repositories/         # *_repository_impl.dart (Either<Failure,T>)
├── domain/
│   ├── entities/             # AuthUser (freezed, pure)
│   ├── value_objects/        # EmailAddress (self-validating)
│   ├── repositories/         # AuthRepository (interface)
│   ├── services/             # (add pure domain services here when needed)
│   └── usecases/             # LoginUseCase, LogoutUseCase
└── presentation/
    ├── bloc/                 # AuthBloc + AuthEvent + AuthState (freezed)
    ├── pages/                # LoginPage
    └── widgets/              # LoginForm
```

`services/` is created per-feature only when a pure domain service is warranted
(e.g. the Adashi rotation engine). `auth` has none today.

## DI
Registration is annotation-based and co-located (`@injectable` /
`@LazySingleton(as: ...)`) and wired into the global composition root by
`injectable_generator` — this is the project's refinement of the blueprint's
manual `<feature>_module.dart` (see ADR 0000).

## Backend endpoints (per blueprint Appendix)
`register`, `login`, `logout`, `refresh-token`, `otp/*`, `change-password`.
Mobile password-reset API: **gap**.
