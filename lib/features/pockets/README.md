# Feature: `pockets`

Create, discover, run and participate in monthly savings pockets — the
blueprint's primary savings engine. This is the first real product feature and
the reference for cross-cutting integration (session + permissions + the
universal states).

## Scope (current slice)
Read-focused: **list** (my pockets) + **detail** (with the current user's role).
Create-pocket, member management, contributions/charity and offline cache are
follow-ups (build behind their backend/flag triggers).

## Layout
```
pockets/
├── pockets.dart              # public barrel
├── data/{datasources,dtos,mappers,repositories}
├── domain/
│   ├── entities/pocket.dart          # Pocket + PocketRole.roleOf (authorization)
│   ├── value_objects/                # Money (₦, kobo), Hands
│   ├── repositories/                 # PocketRepository
│   └── usecases/                     # GetMyPockets, GetPocketDetail
└── presentation/
    ├── cubit/                        # PocketsCubit, PocketDetailCubit (+ states)
    ├── pages/                        # PocketsPage, PocketDetailPage
    └── widgets/                      # PocketCard
```

## Cross-cutting integration
- **Permissions:** `Pocket.roleOf(userId)` derives organiser/member/guest in the
  domain; `PocketDetailCubit` reads the current user from `SessionManager` and
  surfaces the role to the UI (no role checks in widgets).
- **States:** every screen renders via `KpAsyncView` (loading/empty/failure).
- **Errors:** repository maps `AppException → Failure`; cubits fold `Result`.

## Backend endpoints (blueprint Appendix)
`my-pockets`, `pocket/{id}`, `create/pocket`, `pocket/join`, `request/accept`, …
(only the two read endpoints are wired in this slice).
