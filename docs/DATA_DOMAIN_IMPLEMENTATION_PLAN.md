# Data & Domain Implementation Plan

Status: **in progress** — started 2026-07-01.

The app's **presentation layer is complete** for every screen (phases A–Q). The
**domain** (entities, repository interfaces, use cases, value objects) and
**data** (DTOs, mappers, datasources, repository impls) layers are built
feature-by-feature behind the existing cubits, swapping each cubit from
`*_fixtures.dart` placeholders to injected use cases.

This is **not greenfield**: the foundational infrastructure and three reference
slices already exist. Mirror them exactly.

---

## 1. What already exists (do not rebuild)

**Core (`packages/core`)** — `Result<T> = Either<Failure, T>` (fpdart), the
`Failure`/`AppException` sealed hierarchies, `DioErrorMapper`, `UseCase`/
`SyncUseCase`/`NoParams`, `StateStatus`, and the `Money` value object (integer
kobo).

**Networking (`lib/core/network`)** — one injected `Dio` (`network_module.dart`)
with `AuthInterceptor` (bearer token + 401 refresh), `RetryInterceptor`,
`ConnectivityInterceptor`, `LoggingInterceptor`; `TokenStorage`/
`SecureTokenStorage`; `ConnectivityChecker`; `DioErrorMapper`. `AppConfig`
(`core/config`) holds `baseUrl`/timeouts per flavor.

**DI (`lib/core/di`)** — `injectable` + `get_it`, env-scoped. Pattern: a
`@LazySingleton(as: Repo, env: ['dev'])` **fake** + a
`@LazySingleton(as: Repo, env: ['prod','staging'])` **impl**. `dart run
build_runner build` regenerates `injection.config.dart`.

**Reference features (copy these):** `auth`, `pockets`, `contributions`
(contributions even has a `data/sync/contribution_outbox_handler.dart` offline
outbox for mutations). `auth` is the canonical slice per
`docs/feature_creation_guide.md`.

**Cross-cutting:** `SessionManager`/`SessionUser`, `AccessPolicy` (global roles),
per-resource roles live on entities (`Pocket.roleOf(userId)`),
`FeatureFlagService`.

---

## 2. Per-feature recipe (the vertical slice)

For each feature, in order:

1. **Domain entities** (`domain/entities/*.dart`) — `@freezed`, pure Dart, no
   Flutter. Money as `Money`. Per-resource role logic as entity methods. Add a
   private `const X._()` ctor when methods/getters are needed.
2. **Value objects** (`domain/value_objects/*.dart`) — self-validating
   primitives where useful (amounts, references, query contexts).
3. **Repository interface** (`domain/repositories/<feature>_repository.dart`) —
   `abstract interface class`, every method returns `Future<Result<T>>`.
4. **Use cases** (`domain/usecases/*.dart`) — `@injectable`, `implements
   UseCase<T, Params>`; do input validation here (`ValidationFailure`), then
   delegate to the repo. `NoParams` for zero-arg.
5. **DTOs** (`data/dtos/*_dto.dart`) — `@freezed` + `json_serializable`,
   `@JsonKey(name: 'snake_case')`, money as **integer kobo**.
6. **Mappers** (`data/mappers/*_mapper.dart`) — `extension` `toEntity()` /
   `toDto()`; convert kobo↔`Money` here.
7. **Datasources** (`data/datasources/*`) — `abstract interface` + impl. Remote
   impl takes injected `Dio`, wraps calls in `try/catch (DioException) →
   DioErrorMapper.map(e)`. Local datasource for caching where needed
   (SharedPreferences / TokenStorage).
8. **Repository impl** (`data/repositories/<feature>_repository_impl.dart`) —
   `@LazySingleton(as: Repo, env: ['prod','staging'])`; checks
   `ConnectivityChecker`, catches `AppException`, maps to `Failure` via the
   standard `switch`. Returns `Right(dto.toEntity())`.
9. **Fake** (`data/repositories/fake_<feature>_repository.dart`) —
   `@LazySingleton(as: Repo, env: ['dev'])`; serves the old fixture data with a
   small `Future.delayed`. Keeps `flutter run` (dev flavor) working with no
   backend. (Reuse the existing `*_fixtures.dart` values.)
10. **Rewire the cubit(s)** — inject use cases instead of reading fixtures;
    fold `Result` into `StateStatus` + entity-backed state (drop the
    presentation-only view models where an entity now exists, or map
    entity→view-model in the cubit if the view model adds display-only fields).
11. **Barrel** (`<feature>.dart`) — export domain (entities/repo/usecases) +
    pages; never `data/` internals.
12. **Tests** — use-case (mocktail mock repo), repository-impl (mock
    datasources + connectivity, assert exception→failure mapping), cubit
    (`bloc_test`). Keep/adapt existing widget tests.
13. **build_runner** (freezed/json/DI) → **`dart format`** → **`flutter
    analyze`** → **`dart run custom_lint`** → **`flutter test`** (or
    `bash scripts/verify.sh`).

### Cubit rewiring note
Some cubits expose presentation-only **view models** (display strings like
`timeAgo`, `dateLabel`, emoji, avatar tints). Keep those as a thin
view-model layer the cubit builds **from** domain entities — entities carry the
data, view models carry presentation. Where a cubit's state already holds plain
data (e.g. `pockets`), hold the **entity** directly.

### Mutations & the outbox
Write actions (contribute, pay, top-up, grant/revoke, donate, raise dispute,
send nudge, mark-read, …) should be optimistic where the UI implies it and,
for money-moving actions, route through the contributions-style **outbox**
handler so they survive offline/retry. Read the `contribution_outbox_handler`
before adding new mutations.

---

## 3. Sequencing (waves & batches)

Batches group features that share a backend surface or are trivially related;
build a batch together.

### Wave 1 — Simple reads & the user core
- [ ] **profile** — `GET /me` profile + stats. *(first slice; in progress)*
- [ ] **trust** (batch: reputation + KYC + vouches) — shares the user/reputation
  surface with profile.
- [ ] **money** (batch: wallet + payouts + bank accounts) — wallet ledger,
  payouts, bank accounts; money-movement mutations via outbox.
- [ ] **notifications** — inbox list, mark-read, filters.

### Wave 2 — Group & catalog features
- [ ] **adashi** (list + detail + rotation + manage) — rotating-savings groups.
- [ ] **charity** — drive per pocket (donate).
- [ ] **plans** — shopping/grocery/budget plans + items.
- [ ] **discovery** — browse + search pockets/adashis.
- [ ] **school** (batch: owner dashboard + create-school + my-children) — fees,
  terms, children, payments.
- [ ] **friends** — referrals (invite, stats, rewards).

### Wave 3 — Composite & admin
- [ ] **gamification** (batch: leaderboard + achievements) — scopes, podium,
  badges, milestones.
- [ ] **group_collaboration** (batch: chat + disputes) — messages (consider
  realtime/websocket later), dispute cases + timeline + admin resolution.
- [ ] **administration** (batch: super-admin console + organiser dashboard) —
  users/permissions/economy + managed-pocket health/pulse. Role-gated
  (`AccessPolicy.isSuperAdmin`).
- [ ] **dashboard** — aggregator; build LAST (it composes wallet, pockets,
  adashi, gamification, trust). Prefer a single `GET /dashboard` aggregate
  endpoint to avoid N calls.

### Out of scope / no API
- **legal** — static content; no backend (or a single `GET /legal/{doc}` if
  content must be remote). Skip unless requested.

---

## 4. Conventions & gotchas (must-follow)

- **Domain is Flutter-free** — no `package:flutter/*` in `domain/`.
- **Presentation imports domain only** — never `data/` (enforced by
  `no_data_layer_import_in_presentation`); cross-feature imports go through the
  barrel (`no_cross_feature_internal_import`).
- **HTTP only in datasources** — `Dio` injected, never `Dio()`
  (`no_new_dio_instance` / `no_direct_http_in_ui`).
- **Money is integer kobo on the wire**, `Money` in domain; convert in mappers.
- **Every `AppException` is mapped** to a `Failure` at the repo boundary.
- **All user-facing text via l10n**, tokens for color/spacing (unchanged).
- **Dev flavor must keep working** via the env-scoped fake repo — never leave a
  feature with only a prod impl, or `flutter run` (dev) breaks DI.
- **Coverage ≥ 80%** per `feature_creation_guide.md`; run `bash scripts/verify.sh`.
- The **API spec** ([API_SPEC.md](API_SPEC.md)) is the single source of truth
  for endpoints; update it whenever a datasource adds/changes a call.

---

## 5. Progress log

| Feature | Domain | Data | Fake | Cubit rewired | Tests | Done |
|---|---|---|---|---|---|---|
| auth | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ (pre-existing) |
| pockets | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ (pre-existing) |
| contributions | ✅ | ✅ | — | ✅ | ✅ | ✅ (pre-existing) |
| profile | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| trust | | | | | | |
| money | | | | | | |
| notifications | | | | | | |
| adashi | | | | | | |
| charity | | | | | | |
| plans | | | | | | |
| discovery | | | | | | |
| school | | | | | | |
| friends | | | | | | |
| gamification | | | | | | |
| group_collaboration | | | | | | |
| administration | | | | | | |
| dashboard | | | | | | |
