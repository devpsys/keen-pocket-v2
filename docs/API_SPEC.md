# KeenPocket — API Specification

Single source of truth for every HTTP endpoint the mobile app needs. The Flutter
client consumes these via per-feature `*_remote_datasource.dart` classes (one
injected `Dio`). Keep this in sync with the datasources.

> Audience: backend team. This describes the **contract** (paths, auth, request/
> response shapes, errors). Field names are the **wire format** (snake_case) the
> client (de)serializes via `*_dto.dart`.

---

## 0. Global conventions

### Base URL & versioning
- All paths are relative to `AppConfig.baseUrl`, which **must include the version
  prefix**, e.g. `https://api.keenpocket.app/v1`. Paths below are written
  without the version (e.g. `GET /me`).
- Flavors: `dev`, `staging`, `prod` (separate base URLs). The `dev` flavor runs
  against in-app fakes by default — no backend required.

### Auth
- Bearer JWT: `Authorization: Bearer <access_token>` on all endpoints **except**
  `POST /auth/login`, `POST /auth/register`, `POST /auth/refresh`, OTP request.
- On `401`, the client attempts one token refresh (`POST /auth/refresh`) then
  retries; a second `401` clears the session.
- `403` → permission denied (role/capability). Used for super-admin/organiser
  endpoints.

### Headers
| Header | Value |
|---|---|
| `Authorization` | `Bearer <jwt>` |
| `Content-Type` | `application/json` |
| `Accept` | `application/json` |
| `Idempotency-Key` | UUID, **required on all money-moving POSTs** (contribute, top-up, donate, payout). Server must dedupe. |

### Money
- All monetary amounts are **integer minor units (kobo)** — `₦1,234.56` → `123456`.
  Never send/return floats for money. Field names carry no special suffix on the
  wire (the client maps e.g. `hand_price` → `Money`).

### Timestamps & IDs
- Timestamps: ISO-8601 UTC strings, field suffix `_at` (e.g. `created_at`).
  The client renders relative labels ("2h ago") itself — the server need not
  send display strings, but where a screen shows a server-authored label
  (e.g. a notification "time_ago"), it may.
- IDs: opaque strings (UUID/ULID recommended), field `id` or `<thing>_id`.

### Pagination (list endpoints)
Cursor-based. Request: `?limit=20&cursor=<opaque>`. Response envelope:
```json
{
  "data": [ /* items */ ],
  "page": { "next_cursor": "abc123", "has_more": true }
}
```
Endpoints that return small fixed collections (e.g. a user's bank accounts) may
return a bare array.

### Error envelope
Non-2xx responses use:
```json
{
  "error": {
    "code": "validation_error",
    "message": "Human-readable summary.",
    "field_errors": { "email": "invalid", "password": "too_short" }
  }
}
```
Status → client mapping (`DioErrorMapper`):
| HTTP | `error.code` examples | Client `Failure` |
|---|---|---|
| timeout / no connection | — | `NetworkFailure` |
| 401 / 403 | `unauthorized`, `forbidden` | `AuthFailure` |
| 422 | `validation_error` (+ `field_errors`) | `ValidationFailure` |
| 404 | `not_found` | `ServerFailure` |
| other 4xx / 5xx | `server_error` | `ServerFailure` |

`field_errors` is a flat `{ field: code }` map; codes are stable tokens
(`required`, `invalid`, `too_short`, `insufficient_funds`, …) the client may
localize.

### Feature flags
`GET /config/features` → `{ "WALLET_ENABLED": true, "SCHOOL_ENABLED": false, … }`
(keys mirror the `Feature` enum). Hydrated at startup into `FeatureFlagService`.

### Enum values
Enums are sent as the client's lowerCamel/lower token (e.g. `weekly`,
`atRisk`/`at_risk`). **Use snake_case on the wire**; the client maps to its enum.
Each feature section lists its enum value sets.

---

## 1. Auth & session  *(reference feature — partially implemented)*

### POST /auth/login
Auth: none. Body:
```json
{ "email": "ada@keen.app", "password": "secret123" }
```
`200`:
```json
{
  "user": { "id": "u1", "full_name": "Ada", "email": "ada@keen.app",
            "phone": "+234…", "kyc_verified": true,
            "is_super_admin": false, "can_create_school": false,
            "keens_balance": 1500, "avatar_url": null },
  "access_token": "jwt…",
  "refresh_token": "jwt…"
}
```
Errors: `422` (field_errors), `401` (`invalid_credentials`).

### POST /auth/register
Auth: none. Body: `{ full_name, email, phone, password }` → same shape as login.

### POST /auth/refresh
Auth: none (refresh token in body). Body: `{ "refresh_token": "…" }` →
`{ "access_token": "…", "refresh_token": "…" }`.

### POST /auth/logout
Auth: Bearer. Body: none. `204`. Invalidate the refresh token server-side.

### GET /me  *(profile — see §2)*

### OTP (phone verification — onboarding)
- `POST /auth/otp/request` — `{ "phone": "+234…" }` → `204`.
- `POST /auth/otp/verify` — `{ "phone": "+234…", "code": "123456" }` →
  login response shape.

**Enums:** none.

---

## 2. Profile & settings

### GET /me
Auth: Bearer. The signed-in user's profile + reputation stats.
`200`:
```json
{
  "id": "u1", "full_name": "Ada Obi", "phone": "+234 801 234 5678",
  "avatar_url": "https://…",
  "level": 7, "trust_score": 82, "tier": "Trusted Saver",
  "tier_blurb": "Top 15% of savers this quarter.",
  "kyc_verified": true,
  "payment_reliability": 96,
  "pockets_joined": 12, "adashis_completed": 4, "avg_rating": 4.8
}
```

### PATCH /me
Auth: Bearer. Body: any subset of `{ full_name, avatar_url }`. `200` → profile.

### GET /me/settings  /  PATCH /me/settings
Auth: Bearer. Settings blob (notification prefs, locale, biometric toggle…):
```json
{ "locale": "en", "biometric_enabled": true,
  "notifications": { "payments": true, "reminders": true, "marketing": false } }
```
PATCH accepts any subset.

**Enums:** none.

---

## 3. Trust (reputation, KYC, vouches)

### GET /me/trust  /  GET /users/{user_id}/trust
Auth: Bearer. Reputation profile (self, or another member for the public view).
`200`:
```json
{
  "score": 82, "band": "Excellent", "kyc_verified": true,
  "member_name": "Ada Obi", "member_since": "2024-03-01",
  "rank": "Gold", "avatar_url": "https://…",
  "payment_reliability": 96, "pockets_joined": 12,
  "adashis_completed": 4, "avg_rating": 4.8,
  "ratings": [
    { "author": "Bola", "stars": 5, "comment": "Always pays on time",
      "context": "Lagos Techies Cycle", "avatar_url": "https://…" }
  ]
}
```

### POST /me/kyc
Auth: Bearer. Submit KYC. Body:
```json
{ "id_type": "nin", "id_number": "12345678901",
  "full_name": "Ada Obi", "document_url": "https://uploads/…" }
```
`202` → `{ "status": "pending" }`. (Document upload via a presigned-URL flow —
see §16.)
**Enums:** `id_type` = `nin` | `bvn` | `passport` | `drivers_license`;
`status` = `pending` | `verified` | `rejected`.

### Vouches inbox
- `GET /me/vouches` — requests awaiting my recommendation:
  `[{ "id", "requester_name", "requester_avatar_url", "context", "created_at" }]`
- `POST /vouches/{id}/respond` — `{ "decision": "recommend" | "decline" }` → `204`.
- `POST /users/{user_id}/vouch` — request a vouch from someone → `201`.

### POST /users/{user_id}/ratings
Auth: Bearer. Rate an organiser/member after a cycle:
`{ "stars": 5, "comment": "…", "context": "<pocket_or_adashi_id>" }` → `201`.

---

## 4. Money — wallet, payouts, bank accounts

### GET /wallet
Auth: Bearer. `200`:
```json
{
  "balance": 4520000,
  "monthly_delta": "+12%",
  "spending_used": 150000, "spending_limit": 500000,
  "transactions": [
    { "id": "t1", "label": "Top up", "amount": 200000, "is_credit": true,
      "kind": "top_up", "status": "success", "balance_after": 4520000,
      "source": "GTBank ••• 4321", "created_at": "2026-06-30T10:00:00Z" }
  ]
}
```
`GET /wallet/transactions?limit&cursor&kind=` — paginated full ledger.
**Enums:** `kind` = `top_up` | `payment` | `refund`; `status` = `success` |
`settled` | `refunded`.

### POST /wallet/top-up
Auth: Bearer. `Idempotency-Key` required. Body:
`{ "amount": 200000, "bank_account_id": "ba1" }` → `202`:
`{ "transaction": { …WalletTxn }, "checkout_url": "https://…"? }`
(if a 3rd-party checkout is needed). Errors: `422` `insufficient_funds` etc.

### Bank accounts
- `GET /wallet/bank-accounts` →
  `[{ "id", "label", "subtitle", "bank_name", "masked_nuban" }]`
- `POST /wallet/bank-accounts` — `{ "bank_name", "nuban", "account_name" }` → `201`.
- `DELETE /wallet/bank-accounts/{id}` → `204`.
- `GET /banks` — supported banks list `[{ "code", "name" }]` (for dropdowns).

### Payouts
- `GET /payouts` →
  ```json
  { "payouts": [ { "id", "reference", "amount", "status", "bank_name",
                   "created_at" } ],
    "collections": [ { "id", "name", "bank_name", "amount", "percent",
                       "progress_label" } ] }
  ```
- `POST /payouts` — initiate withdrawal. `Idempotency-Key` required.
  `{ "amount", "bank_account_id", "source": "<pocket_or_adashi_id>"? }` → `202`.
**Enums:** `status` = `success` | `pending` | `failed`.

---

## 5. Notifications

### GET /notifications
Auth: Bearer. `?filter=all|unread|payments|members&limit&cursor`. Item:
```json
{ "id", "title", "body", "is_read": false, "kind": "payment",
  "category": "Payments", "created_at": "…",
  "detail_body": "…", "goal_percent": 0.42, "saved_label": "₦450k",
  "target_label": "₦1.2M", "related_pocket": "Lagos Techies",
  "related_pocket_image_url": "https://…", "source_account": "GTBank ••• 1",
  "mascot_tip": "…" }
```
Detail fields (`detail_body`, `goal_percent`, …) optional per `kind`.

- `POST /notifications/read-all` → `204`.
- `POST /notifications/{id}/read` → `204`.
- `GET /notifications/unread-count` → `{ "count": 3 }` (badge).
**Enums:** `kind` = `payment` | `member` | `invite` | `reminder` | `security` |
`adashi` | `support`.

---

## 6. Pockets (savings)  *(reference feature — implemented)*

### GET /pockets  *(my pockets)*
Auth: Bearer. `[PocketDto]` where:
```json
{ "id", "name", "organiser_id", "hand_price": 500000, "total_hands": 12,
  "filled_hands": 8, "member_count": 8, "is_public": false,
  "member_ids": ["u1","u2"] }
```
`GET /pockets/discover?limit&cursor&q=` — public/browsable pockets (see §13).

### GET /pockets/{id}
Auth: Bearer. Full detail (members, contributions, shopping suggestions,
payout, rules, top contributors). Superset of the list DTO plus:
```json
{ "members": [ { "user_id", "name", "avatar_url", "role", "hands" } ],
  "shopping": [ { "id", "name", "category", "unit_price", "people_sharing",
                  "total_cost", "emoji", "suggestions_closed" } ],
  "payout": { "bank_name", "masked_nuban", "scheduled_at" },
  "charity": { …see §7 } }
```

### Mutations
- `POST /pockets` — create. `{ name, hand_price, total_hands, is_public,
  category, schedule }` → `201` PocketDto.
- `POST /pockets/{id}/join` → `200` (or `202` if approval needed).
- `POST /pockets/{id}/shopping` — suggest item. `{ name, category, unit_price,
  emoji }` → `201`.
- `DELETE /pockets/{id}/shopping/{item_id}` → `204`.
- `POST /pockets/{id}/members/{user_id}/approve` | `/remove` — organiser only.
- `PUT /pockets/{id}/payout` — `{ bank_account_id }` → `200`.
- Contributions to a pocket go through §8 with `host=pocket`.
**Enums:** `role` = `organiser` | `member` | `guest`.

---

## 7. Charity drives

### GET /pockets/{pocket_id}/charity
Auth: Bearer. `{ "title", "goal": 1000000, "raised": 640000, "donor_count": 23 }`.

### POST /pockets/{pocket_id}/charity/donate
Auth: Bearer. `Idempotency-Key`. `{ "amount": 50000 }` → `200` (updated drive).

### PUT /pockets/{pocket_id}/charity
Auth: Bearer (organiser). `{ "title", "goal", "cause" }` → `200`.

---

## 8. Contributions & invoices  *(reference feature — implemented)*

Generic contribution ledger keyed by a **host** (a pocket / adashi / school).
> Note: the existing client datasource calls `invoices`, `invoice/create`,
> `payment/status/update`. Backend should expose these (or align all to the
> `/invoices` REST forms below and the client will be updated to match).

### GET /invoices
Auth: Bearer. `?host=pocket|adashi|school&host_id=<id>&reference=<opt>`. Item:
```json
{ "id", "host": "adashi", "host_id": "a1", "reference": "cycle-3",
  "amount": 500000, "status": "pending", "payer_id", "payer_name",
  "created_at", "verified_at" }
```

### POST /invoices  *(client: `invoice/create`)*
Auth: Bearer. `Idempotency-Key`. Body:
`{ "host", "host_id", "reference", "amount" }` → `201` InvoiceDto.

### POST /invoices/{id}/verify  *(client: `payment/status/update`)*
Auth: Bearer (organiser). `{ "status": "verified" }` → `200` InvoiceDto.
**Enums:** `host` = `pocket` | `adashi` | `school`; `status` = `pending` |
`verified` | `failed` | `refunded`.

---

## 9. Adashi (rotating savings)

### GET /adashis  *(my circles)*
Auth: Bearer. Item (`AdashiSummary`):
```json
{ "id", "name", "per_cycle": 500000, "member_count": 12,
  "current_cycle": 3, "total_cycles": 12, "mode": "auto",
  "frequency": "monthly", "category": "business", "is_active": true,
  "next_payout_days": 8, "member_avatar_urls": ["…"] }
```

### GET /adashis/{id}
Auth: Bearer. Detail with `rotation` (members + positions + status),
`admin_name`, `reputation`, `paid_members`, `collected`, `target`,
`receiver_name`, `receiver_amount`, `contribute_amount`, `payout_bank`,
`history: [{ "label", "total", "closed" }]`.

### GET /adashis/{id}/rotation  &  GET /adashis/{id}/manage
Auth: Bearer (manage = organiser). Rotation steps + member roster + pending
payments (`[{ "name", "amount" }]`).

### Mutations
- `POST /adashis` — create. `{ name, per_cycle, total_cycles, frequency, mode,
  category }` → `201`.
- `POST /adashis/{id}/join` → `200|202`.
- `POST /adashis/{id}/advance` — organiser advances the cycle/rotation → `200`.
- `POST /adashis/{id}/members/{user_id}/verify` — verify a member's payment.
- Contributions via §8 with `host=adashi`.
**Enums:** `mode` = `auto` | `manual`; `frequency` = `weekly` | `monthly`;
`category` = `home` | `vehicle` | `education` | `business` | `market`;
member rotation `status` = `received` | `current` | `upcoming`;
cycle step `status` = `done` | `active` | `next` | `locked`.

---

## 10. Plans (shopping / grocery / budget)

### GET /plans
Auth: Bearer. Item:
```json
{ "id", "name", "period_label": "This week", "cadence": "weekly",
  "bought": 4, "pending": 2, "deferred": 1, "spent": 1500000,
  "budget": 2000000 }
```
### GET /plans/{id} — plan + items `[{ id, name, qty, price, status }]`.
### Mutations
- `POST /plans` — `{ name, cadence, budget }` → `201`.
- `PATCH /plans/{id}` / `DELETE /plans/{id}`.
- `POST /plans/{id}/items` — `{ name, qty, price }` → `201`.
- `PATCH /plans/{id}/items/{item_id}` — `{ status }` (mark bought / defer).
**Enums:** `cadence` = `weekly` | `monthly`; item `status` = `pending` |
`bought` | `deferred`.

---

## 11. Discovery & search

### GET /discover
Auth: Bearer. `?q=&type=pocket|adashi&limit&cursor`. Item (`DiscoverItem`):
```json
{ "id", "name", "type": "adashi", "emoji": "🏠", "admin_name": "Ada",
  "badge": "kyc_verified", "contribution": 500000, "contribution_unit": "/mo",
  "metric_value": "Starts Jul 1", "metric_is_start_date": true,
  "rating": 4.8, "member_count": 12 }
```
**Enums:** `type` = `pocket` | `adashi`; `badge` = `kyc_verified` | `official` |
`adashi`.

---

## 12. School (fees, terms, children)

### GET /schools/mine  *(owner dashboard)*
Auth: Bearer (school owner). `SchoolView`:
```json
{ "name", "class_count": 9, "student_count": 214,
  "fees_collected": 425000000, "unpaid_fees": 120000000,
  "overall_percent": 0.64,
  "terms": [ { "label": "Term 1", "collected": 425000000,
               "expected": 500000000, "percent": 0.85, "accent": "primary" } ],
  "trend": [ { "label": "Term 1", "fraction": 0.85, "accent": "primary" } ] }
```

### POST /schools  *(create school)*
Auth: Bearer (`can_create_school`). `{ name, contact, address, logo_url?,
banner_url?, bank: { bank_name, nuban, account_name } }` → `201`.

### GET /me/children  *(parent view)*
Auth: Bearer. Item (`Child`):
```json
{ "id", "name", "school", "class_name", "avatar_url",
  "plan_label": "30/30/40 Split", "next_invoice_days": 45, "receipt_count": 2,
  "terms": [ { "label": "Term 1", "fee": 4500000, "paid": 4500000,
               "status": "paid" } ] }
```
- `POST /me/children` — link a child `{ name, school_id, class_name }` → `201`.
- `POST /children/{id}/pay` — pay a term `Idempotency-Key`
  `{ "term_label", "amount" }` → `202` (creates an invoice, §8 `host=school`).
**Enums:** term `status` = `paid` | `partial` | `unpaid`;
`accent` = `primary` | `primaryDark` | `secondary` | `neutral`.

---

## 13. Friends & referrals

### GET /referrals
Auth: Bearer.
```json
{ "invite_code": "ADA-7K2", "invite_url": "https://keen.app/r/ADA-7K2",
  "stats": { "invited": 8, "qualified": 5, "rewarded": 3,
             "earned": 150000 },
  "circle": [ { "id", "name", "joined_label": "2d ago", "status": "qualified",
                "detail": "Started saving", "reward_amount": "₦500" } ] }
```
- `POST /referrals/invite` — `{ "channel": "whatsapp"|"sms"|"link",
  "phone"? }` → `200` (returns share payload).
**Enums:** `status` = `pending` | `qualified` | `rewarded`.

---

## 14. Gamification (leaderboard, achievements)

### GET /leaderboard
Auth: Bearer. `?scope=this_week|all_time`.
```json
{ "scope": "this_week",
  "podium": [ { "rank": 1, "name", "points": 1200, "avatar_url" } ],
  "rows":   [ { "rank": 4, "name", "points", "avatar_url", "trend": "up" } ],
  "standing": { "rank": 4, "contributions": 18, "avatar_url",
                "percentile": "Top 10%", "points_earned": 320,
                "total_contributions": 54, "focus_mode": false } }
```
**Enums:** `scope` = `this_week` | `all_time`; `trend` = `up` | `flat` | `down`.

### GET /me/achievements
Auth: Bearer.
```json
{ "streak_weeks": 6, "streak_days_done": 5, "streak_days_total": 7,
  "freezes": 2, "earned_count": 4, "elite_goal_done": 3, "elite_goal_total": 5,
  "badges": [ { "id", "kind": "reliablePayer", "label", "caption",
                "earned": true } ],
  "milestones": [ { "kind": "consistentContributor", "label",
                    "percent": 0.7 } ] }
```
**Enums:** badge `kind` = `reliablePayer` | `topOrganizer` | `recruiter` |
`bigSaver`; milestone `kind` = `consistentContributor` | `groupGuardian`.

---

## 15. Group collaboration (chat & disputes)

### Chat
- `GET /groups/{group_id}/messages?limit&cursor` →
  `[{ "id", "author", "author_id", "text", "created_at", "avatar_url" }]`
  (client derives `is_mine` from the session user id, `author_tint` from role).
- `POST /groups/{group_id}/messages` — `{ "text" }` → `201` message.
- *(Realtime later: WebSocket `wss://…/groups/{id}` — out of scope for v1; poll.)*

### Disputes
- `GET /groups/{group_id}/disputes` → list of `Dispute`:
  ```json
  { "id", "title", "author", "created_at", "description", "status",
    "resolution_note", "case_number", "preview_quote", "investigation",
    "draft_note",
    "timeline": [ { "title", "created_at", "state": "done", "body" } ] }
  ```
- `POST /groups/{group_id}/disputes` — raise `{ title, description }` → `201`.
- `POST /disputes/{id}/resolve` — admin `{ "decision": "resolved"|"dismissed",
  "note" }` → `200`.
**Enums:** dispute `status` = `open` | `resolved` | `dismissed`;
timeline `state` = `done` | `active` | `pending`.

---

## 16. Administration (super-admin + organiser)  — role-gated

All require `403` for non-super-admins (console) / non-organisers (dashboard).

### GET /admin/console  *(super-admin)*
```json
{ "users": [ { "id", "name", "role": "educator", "email", "phone",
              "avatar_url", "can_create_school": true } ],
  "schools": [ { "id", "name", "owner", "is_open": true } ],
  "economy": { "coins_enabled": true, "pocket_cost": 150,
               "adashi_cost": 450, "school_cost": 2500 },
  "stats": { "daily_users": "1.2k", "schools_count": 48 },
  "mascot_note": "…" }
```
- `GET /admin/users?q=&limit&cursor` — searchable users.
- `POST /admin/users/{id}/school-permission` — `{ "granted": true }` → `200`.
- `PUT /admin/economy` — `{ coins_enabled, pocket_cost, adashi_cost,
  school_cost }` → `200`.
**Enums:** user `role` = `standard_user` | `educator`.

### GET /admin/organiser  *(organiser dashboard)*
```json
{ "active_pockets": 12, "total_managed": 420000000,
  "managed_delta_pct": 12, "active_members": 842, "new_members_today": 24,
  "urgent_actions": 5,
  "pockets": [ { "type": "adashi", "name", "members": 12,
                 "collected": 45000000, "target": 120000000,
                 "health": "pending", "health_count": 2 } ],
  "pulse": [ { "title", "subtitle", "tone": "urgent", "action": "nudge" } ] }
```
- `POST /admin/organiser/pulse/{id}/act` — `{ "action": "review"|"nudge" }` → `204`.
**Enums:** pocket `type` = `adashi` | `savings`; `health` = `pending` |
`atRisk`/`at_risk` | `healthy` | `overdue`; pulse `tone` = `info` | `urgent`;
`action` = `review` | `nudge`.

---

## 17. Dashboard (aggregate — build last)

### GET /dashboard
Auth: Bearer. One aggregate to avoid N calls on home load:
```json
{ "greeting_name": "Ada", "total_saved": 18500000, "active_pockets": 5,
  "streak_days": 12, "weekly_goal_progress": 0.8, "weekly_goal_complete": false,
  "adashi_groups": 2, "reputation_tier": "Trusted Saver",
  "wallet_balance": 4520000, "freezes_left": 2, "points": 1840,
  "badges": ["reliablePayer","bigSaver"],
  "featured_pockets": [ { "id", "name", "hand_price", "tag", "schedule_label" } ],
  "featured_adashi": { "id", "name", "per_cycle", "members",
                       "cycle_current", "cycle_total" } }
```

---

## 18. Media uploads (shared)

For avatars, school logos/banners, KYC documents:
1. `POST /uploads/sign` — `{ "purpose": "avatar"|"school_logo"|"kyc_doc",
   "content_type": "image/png" }` → `{ "upload_url", "file_url", "fields": {…} }`.
2. Client PUTs the file to `upload_url`, then submits `file_url` to the relevant
   endpoint.

---

## 19. Config

- `GET /config/features` → feature-flag map (§0).
- `GET /banks` → supported banks (§4).

---

## Appendix — endpoint index

| Area | Endpoints |
|---|---|
| Auth | `POST /auth/{login,register,refresh,logout}`, `POST /auth/otp/{request,verify}` |
| Profile | `GET/PATCH /me`, `GET/PATCH /me/settings` |
| Trust | `GET /me/trust`, `GET /users/{id}/trust`, `POST /me/kyc`, `GET /me/vouches`, `POST /vouches/{id}/respond`, `POST /users/{id}/vouch`, `POST /users/{id}/ratings` |
| Money | `GET /wallet`, `GET /wallet/transactions`, `POST /wallet/top-up`, `GET/POST/DELETE /wallet/bank-accounts`, `GET /payouts`, `POST /payouts`, `GET /banks` |
| Notifications | `GET /notifications`, `POST /notifications/{read-all,{id}/read}`, `GET /notifications/unread-count` |
| Pockets | `GET /pockets`, `GET /pockets/{id}`, `POST /pockets`, `POST /pockets/{id}/join`, shopping/members/payout sub-routes |
| Charity | `GET/PUT /pockets/{id}/charity`, `POST /pockets/{id}/charity/donate` |
| Contributions | `GET /invoices`, `POST /invoices`, `POST /invoices/{id}/verify` |
| Adashi | `GET /adashis`, `GET /adashis/{id}`, `/rotation`, `/manage`, `POST /adashis`, `/join`, `/advance`, `/members/{id}/verify` |
| Plans | `GET /plans`, `GET /plans/{id}`, CRUD + items |
| Discovery | `GET /discover` |
| School | `GET /schools/mine`, `POST /schools`, `GET/POST /me/children`, `POST /children/{id}/pay` |
| Referrals | `GET /referrals`, `POST /referrals/invite` |
| Gamification | `GET /leaderboard`, `GET /me/achievements` |
| Chat/Disputes | `GET/POST /groups/{id}/messages`, `GET/POST /groups/{id}/disputes`, `POST /disputes/{id}/resolve` |
| Admin | `GET /admin/console`, `GET /admin/users`, `POST /admin/users/{id}/school-permission`, `PUT /admin/economy`, `GET /admin/organiser`, `POST /admin/organiser/pulse/{id}/act` |
| Dashboard | `GET /dashboard` |
| Shared | `POST /uploads/sign`, `GET /config/features` |
