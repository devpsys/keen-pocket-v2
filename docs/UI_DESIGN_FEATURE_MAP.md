# KeenPocket — UI Design ↔ Architecture Feature Map

> **Purpose.** A traceability matrix that connects the reorganised **`ui-designs/`** screen library (phase folders A–Q) to the **feature modules** defined in **[FLUTTER_ARCHITECTURE.md](FLUTTER_ARCHITECTURE.md)**. It answers three questions for every contributor:
> 1. *"This design screen — which Flutter feature module, route, and page does it become?"*
> 2. *"This feature module — which designs implement it, and are any missing?"*
> 3. *"Where do designs and architecture diverge (cross-feature screens, variants, gaps)?"*
>
> **Sources.** Designs: `ui-designs/<PHASE>_<name>/<screen>.{png,html}` (each screen has a PNG render + an HTML reference). Features: the 19 modules (incl. `friends` + `legal`) + 2 shared packages in the architecture blueprint. Design coverage is also tracked against the **[MOBILE_STITCH_PROMPT.md](MOBILE_STITCH_PROMPT.md)** brief (phases A–R), which is *ahead* of the rendered design set in a few places (Friends, password reset, Legal) — those are called out as gaps.
>
> **Key idea.** The design **phase folders are not 1:1 with feature modules.** Design phases were organised for a *designer's* mental model; feature modules follow *domain boundaries*. Most align, but a few screens live in one phase folder yet belong to a different feature (e.g. pocket-shopping, pay-from-wallet). Those are flagged explicitly.

---

## 1. Phase ↔ Feature crosswalk (at a glance)

| Design phase folder | Primary feature module(s) | Notes |
|---|---|---|
| `A_foundation_design_system` | **`packages/design_system`** (+ `packages/core`) | Brand tokens + assets, not a feature |
| `B_authentication_onboarding` | **`auth`** (+ `session`) | Splash/onboarding/login/register/OTP |
| `C_dashboard_home` | **`dashboard`** | Aggregation feature |
| `D_savings_pockets` | **`pockets`** | + hosts `contributions`, `group_collaboration`, `trust` surfaces |
| `E_adashi` | **`adashi`** | The rotation engine |
| `F_contributions_invoices` | **`contributions`** | `pay_from_wallet` also uses `money` |
| `G_charity_drives` | **`charity`** | Hosted inside a pocket |
| `H_shopping_grocery_plans` | **`plans`** + **`pockets`** | `group_shopping_suggestions` belongs to `pockets` |
| `I_trust_layer` | **`trust`** (reputation/ratings/kyc/vouching) | Rendered on Pocket/Adashi/Profile too |
| `J_disputes_chat` | **`group_collaboration`** | Attaches to both Pocket & Adashi |
| `K_wallet_payouts_bank` | **`money`** | Flag-gated (ships OFF) |
| `L_notifications` | **`notifications`** | |
| `M_discover_search_insights` | **`discovery`** | discover + search + insights |
| `N_gamification_leaderboard_referrals` | **`gamification`** + **`friends`** | leaderboard/badges → `gamification`; `refer_earn` → `friends` |
| `O_profile_settings` | **`profile`** | composes `trust` + `gamification` + `money` |
| `P_school_fee_management` | **`school`** | B2B sub-product |
| `Q_administration` | **`administration`** | super admin + admin health |
| *(no folder)* | **`session`** | Cross-cutting, no UI of its own |

---

## 2. Master traceability matrix (feature → screens → routes)

Legend: **M** = phone/mobile render · **T** = tablet render · route/page names follow the architecture's `go_router` + `*_page.dart` conventions. Paths are under `ui-designs/`.

### `packages/design_system` ← `A_foundation_design_system`
Not a feature — the brand kit + assets that **every** feature consumes (`KpColors`, `KpButton`, `KpCard`, `KpEmptyState`, Mr K, Keens coin).

| Design file | Becomes |
|---|---|
| `A_foundation_design_system/keenpocket_design_system_1.md`, `…_2.md` | Source of `design_system` tokens (colors/typography/spacing/radii/shadows) + component specs |
| `…/a_friendly_simple_rounded_mascot_character_named_mr_k…png` | `assets/images/mr_k_wave.png` (mascot) |
| `…/a_3d_gold_coin_icon_for_keens_currency…png` | `assets/images/keens_coin.png` (🪙) |
| `…/kandfriendsnormal.png` | `assets/images/kandfriends.png` (auth/celebration art) |

### `auth` ← `B_authentication_onboarding`  ·  `lib/features/auth`
| Design (M / T) | Route → Page |
|---|---|
| `keenpocket_splash` / `keenpocket_splash_tablet` | `/splash` → `SplashPage` |
| `onboarding_carousel` / `onboarding_carousel_tablet` | `/onboarding` → `OnboardingPage` |
| `login` / `login_tablet` *(and variant `login_updated_mascot`)* | `/login` → `LoginPage` |
| `register` / `register_tablet` *(and variant `register_updated_mascot`)* | `/register` → `RegisterPage` |
| `otp_verification` / `otp_verification_tablet` | `/otp` → `OtpVerificationPage` (gated by `OTP_ENABLED`) |
| **GAP** — forgot-password (email), reset-password | `/forgot-password`, `/reset-password/:token` → not yet designed (brief Phase B6) |

### `dashboard` ← `C_dashboard_home`  ·  `lib/features/dashboard`
| Design (M / T) | Route → Page |
|---|---|
| `home_dashboard` / `home_dashboard_tablet_1`, `home_dashboard_tablet_2` | `/home` (Tab 1) → `DashboardPage` |
| `keenpocket_home` *(alt "Member Musa" dashboard variant)* | variant of `DashboardPage` — pick canonical |

### `pockets` ← `D_savings_pockets` (+ one screen from `H`)  ·  `lib/features/pockets`
| Design (M / T) | Route → Page |
|---|---|
| `my_pockets_1`, `my_pockets_2` / `my_pockets_tablet` | `/pockets` → `PocketsListPage` *(2 variants — choose one)* |
| `create_pocket` / `create_pocket_tablet` | `/pockets/new` → `CreatePocketPage` |
| `pocket_detail_hub` / `pocket_detail_hub_tablet` | `/pockets/:id` → `PocketDetailPage` |
| `public_pocket_view` / `public_pocket_view_tablet` | `/pockets/:id/public` → `PublicPocketPage` |
| `manage_pocket_members` / `manage_pocket_members_tablet` | `/pockets/:id/manage` → `ManagePocketPage` |
| `group_shopping_suggestions` / `_tablet` **(lives in `H`)** | embedded in `PocketDetailPage` → `PocketShoppingSection` |

### `adashi` ← `E_adashi`  ·  `lib/features/adashi`
| Design (M / T) | Route → Page |
|---|---|
| `adashi_circles` / `adashi_circles_tablet` | `/adashi` → `AdashiListPage` |
| `adashi_hub` / `adashi_hub_tablet` | `/adashi/:id` → `AdashiDetailPage` (current cycle + rotation) |
| `adashi_rotation` | rotation-timeline component of `AdashiDetailPage` → `RotationStepper` |
| `create_adashi` / `create_adashi_tablet` | `/adashi/new` → `CreateAdashiPage` |
| `manage_adashi` / `manage_adashi_tablet` | `/adashi/:id/manage` → `ManageAdashiPage` (admin overrides) |

### `contributions` ← `F_contributions_invoices`  ·  `lib/features/contributions`
| Design (M / T) | Route → Page |
|---|---|
| `contribute_amount` / `contribute_amount_tablet` | `/contribute` → `ContributeAmountPage` |
| `allocate_months` / `allocate_months_tablet` | `/contribute/allocate` → `AllocateMonthsPage` |
| `invoice_history` | `/invoices` → `InvoiceHistoryPage` (+ organiser verify/mark-paid variant) |
| `pay_from_wallet` / `pay_from_wallet_tablet` | `/contribute/wallet` → `PayFromWalletSheet` — **uses `money` use cases** |

### `charity` ← `G_charity_drives`  ·  `lib/features/charity`
| Design (M / T) | Route → Page |
|---|---|
| `charity_setup` / `charity_setup_tablet` | `/pockets/:id/charity/setup` → `CharitySetupPage` (organiser) |
| `charity_donate_card` / `charity_donate_card_tablet` | embedded in `PocketDetailPage` → `CharityDonateCard` |

### `plans` ← `H_shopping_grocery_plans` *(standalone subset)*  ·  `lib/features/plans`
| Design (M / T) | Route → Page |
|---|---|
| `grocery_plans_list` / `grocery_plans_list_tablet` | `/shopping` (Tab 3) → `PlansListPage` |
| `create_grocery_plan` / `create_grocery_plan_tablet` | `/shopping/new` → `CreatePlanPage` |
| `grocery_plan_detail` / `grocery_plan_detail_tablet` | `/shopping/:id` → `PlanDetailPage` |
| *(`group_shopping_suggestions` → see `pockets`)* | — |

### `trust` ← `I_trust_layer`  ·  `lib/features/trust` *(sub-modules: reputation · ratings · kyc · vouching)*
| Design (M / T) | Sub-module → Route/Component |
|---|---|
| `vouches_inbox` / `vouch_requests_tablet` | **vouching** → `/vouches` → `VouchesInboxPage` |
| `kyc_verification` / `kyc_verification_tablet` | **kyc** → `/kyc` → `KycVerificationPage` (gated `KYC_ENABLED`) |
| `rate_organiser_modal` / `rate_organiser_tablet` | **ratings** → `RateOrganiserSheet` (modal, launched from group detail) |
| `reputation_trust_score` / `reputation_trust_hub_tablet` | **reputation** → `ReputationBlock` (rendered on Profile + group headers) |

### `group_collaboration` ← `J_disputes_chat`  ·  `lib/features/group_collaboration`
| Design (M / T) | Route → Component |
|---|---|
| `group_chat_panel` / `group_chat_tablet` | `GroupChatPanel` (FAB + panel; docked on tablet) — `GroupContext(pocket\|adashi)` |
| `disputes_hub` / `disputes_hub_tablet` | `DisputesSection` (+ raise/resolve modals) on group detail |

### `money` ← `K_wallet_payouts_bank`  ·  `lib/features/money`
| Design (M / T) | Route → Page |
|---|---|
| `wallet_home` / `wallet_home_tablet` | `/wallet` → `WalletHomePage` (gated `WALLET_ENABLED`) |
| `payouts_bank_hub` / `payouts_bank_hub_tablet` | `/payouts` → `PayoutsBankPage` (gated `PAYOUTS_ENABLED`); also hosts `BankAccountsList` |

### `notifications` ← `L_notifications`  ·  `lib/features/notifications`
| Design (M / T) | Route → Page |
|---|---|
| `notifications_inbox` / `notifications_inbox_tablet` | `/notifications` → `NotificationsInboxPage` (FCM deep-links) |

### `discovery` ← `M_discover_search_insights`  ·  `lib/features/discovery`
| Design (M / T) | Route → Page |
|---|---|
| `discover_pockets` | `/discover` (Tab 4) → `DiscoverPage` (pockets section) |
| `explore_adashi` / `explore_adashi_tablet` | `/discover` (adashi section) / `/adashi/:id/public` → `DiscoverPage` / `PublicAdashiPage` |
| `insights_reports` / `insights_reports_tablet` | `/insights` → `InsightsPage` |
| **GAP (minor)** — dedicated search-results screen | `/search` → `SearchPage` (reuses discover cards; no separate render) |

### `gamification` ← `N_gamification_leaderboard_referrals`  ·  `lib/features/gamification`
| Design (M / T) | Route → Page |
|---|---|
| `leaderboard_rankings` / `leaderboard_rankings_tablet` | `/leaderboard` → `LeaderboardPage` |
| `my_achievements_badges` / `my_achievements_badges_tablet` | `/badges` → `BadgesPage` (also embedded on Profile) |
| `refer_earn` / `refer_earn_tablet` | **`friends`** feature → the invite/referral block of `/friends` → `FriendsInvitesPage` (`InviteBlock`); friend-graph sections undesigned (§5) |

### `profile` ← `O_profile_settings`  ·  `lib/features/profile`
| Design (M) | Route → Page |
|---|---|
| `my_profile` | `/profile` (Tab 5) → `MyProfilePage` (composes `trust` + `gamification` + `money`) |
| `public_profile` | `/u/:id` → `PublicProfilePage` |
| `settings` | `/settings` → `SettingsPage` |
| **GAP** — tablet renders for profile/settings | use master-detail (see architecture Z6) — not yet rendered |

### `school` ← `P_school_fee_management`  ·  `lib/features/school`
| Design (M) | Route → Page |
|---|---|
| `create_school` | `/school/new` → `CreateSchoolPage` (gated `SCHOOL_ENABLED` + `can_create_school`) |
| `school_dashboard_owner` | `/school/:id` → `SchoolDashboardPage` |
| `my_children` | `/my-children` → `MyChildrenPage` (parent) |
| **GAP** — tablet renders | school dashboard is table-heavy → tablet master-detail recommended |

### `administration` ← `Q_administration`  ·  `lib/features/administration`
| Design (M) | Route → Page |
|---|---|
| `super_admin_console` | `/admin/super` → `SuperAdminPage` (`is_super_admin`) |
| `admin_health_dashboard` | `/admin/health` → `AdminHealthPage` (organiser) |
| **GAP** — tablet renders | console is wide-table; design tablet variant |

### `session` ← *(no design)*  ·  `lib/core/session`
Cross-cutting; no screens. Renders the **permission-restricted** and **feature-disabled** universal states inside other features.

---
## 3. Cross-feature screens (one design, multiple feature modules)

These designs are **composed** from more than one feature. The hosting feature owns the *page*; the contributed pieces come from another feature's **domain use cases + widgets** (never its internals — see the architecture's dependency rule).

| Design | Host feature (owns page) | Contributing features (composed in) |
|---|---|---|
| `pocket_detail_hub` | `pockets` | `contributions` (my-invoices, Contribute), `charity` (donate card), `group_collaboration` (chat FAB + disputes), `trust` (reputation chip, KYC badge, rate-admin), `money` (payout-account selector), `pockets` shopping section |
| `adashi_hub` / `adashi_rotation` | `adashi` | `contributions` (contribute, verify), `group_collaboration` (chat + disputes), `trust` (rate-admin, reputation), `money` (payout account) |
| `my_profile` | `profile` | `trust` (reputation ring + ratings + KYC card), `gamification` (badges grid), `money` (bank-accounts entry) |
| `public_profile` | `profile` | `trust` (reputation, KYC badge, ratings), `discovery` (open-groups-by-user) |
| `home_dashboard` | `dashboard` | read-only use cases of `pockets`, `adashi`, `contributions`, `gamification`, `trust`, `money` |
| `pay_from_wallet` | `contributions` | `money` (wallet balance + debit use case) |
| `manage_pocket_members` | `pockets` | `trust` (guarantor/vouch status chips) |

**Build implication:** implement the contributed pieces as **reusable widgets backed by the owning feature's use cases**, exported via that feature's barrel — e.g. `trust` exports `ReputationChip`, `RateOrganiserSheet`, `KycBadge`; `contributions` exports `ContributeButton`; `group_collaboration` exports `GroupChatFab` + `DisputesSection`. The pocket/adashi/profile pages assemble them.

## 4. Variants & duplicates (pick a canonical render)

Multiple Stitch passes produced alternative renders of the same screen. Choose one canonical per screen before build; keep the others as references only.

| Screen | Variants present | Recommendation |
|---|---|---|
| Login | `login`, `login_updated_mascot` (+ `login_tablet`) | `login_updated_mascot` if it reflects the final Mr K; else `login` |
| Register | `register`, `register_updated_mascot` (+ `register_tablet`) | match the Login choice for consistency |
| Pockets list | `my_pockets_1`, `my_pockets_2` (+ `my_pockets_tablet`) | pick the layout closest to the brief's photo-card spec (Phase D) |
| Dashboard | `home_dashboard`, `keenpocket_home`, `home_dashboard_tablet_1`, `home_dashboard_tablet_2` | `home_dashboard` as canonical phone; choose one tablet variant |

## 5. Coverage gaps — designs needed but not yet rendered

The architecture/brief defines these surfaces; **no PNG/HTML render exists** in `ui-designs/` yet. Track as design backlog. (The brief **[MOBILE_STITCH_PROMPT.md](MOBILE_STITCH_PROMPT.md)** already contains paste-ready Stitch prompts for the items marked ✅-prompt.)

| Missing design | Feature module | Why it matters | Brief? |
|---|---|---|---|
| **Forgot-password (email)** + **Reset-password** | `auth` | Live default reset flow (Laravel broker); OTP screen alone is insufficient | ✅ Phase B6 |
| **Friends & Invites** (friend-graph: add/incoming/friends/outgoing) | **`friends`** module *(now in the architecture)* | New codebase feature (`Friendship`); only `refer_earn` (the invite block) is rendered — the friend-graph sections are undesigned | ✅ Phase N (revised) |
| **Terms of Service** + **Privacy Policy** + **Delete account** | **`legal`** module *(now in the architecture)* | Store-review requirement; consent at signup; deletion is a store blocker | ✅ Phase R |
| **Delete account / data export** | `profile` + backend | Apple/Google store blocker; no backend endpoint yet | ✅ Phase R / Z9 |
| **Search results** screen | `discovery` | Currently only discover galleries; a dedicated `/search` view | partial |
| **Tablet renders** for `profile`, `settings`, `school`, `administration`, `discover_pockets` (phone only), `adashi_rotation`, `invoice_history`, `my_profile`, `public_profile` | respective features | Tablet master-detail parity (architecture Z6) | tablet guidance in each phase |
| **Payment-gateway** (card/checkout) screens | `money` | Only wallet/payouts rendered; gateway flow undesigned (ships OFF) | — |

> **Status — resolved:** `FLUTTER_ARCHITECTURE.md` now defines the **`friends`** module (referrals moved out of `gamification` into `friends`, mirroring the `/referrals → /friends` redirect) and a **`legal`** module (Terms/Privacy/consent + account-deletion). The remaining work is purely **design**: render the friend-graph sections and the legal/delete screens (the Stitch prompts already exist in MOBILE_STITCH_PROMPT Phases N & R).

## 6. Designs with no feature mismatch — sanity check

Every rendered screen in `ui-designs/` maps cleanly to exactly one **owning** feature (variants aside). There are **no orphan designs** (screens with no feature). The only "phase ≠ feature" cases are intentional and documented in §2/§3:
- `group_shopping_suggestions` (phase **H**) → **`pockets`** feature.
- `pay_from_wallet` (phase **F**) → **`contributions`** page using **`money`**.
- `explore_adashi` (phase **M**) → **`discovery`** (and doubles as the public-adashi view used by **`adashi`**).
- `reputation_*`, `rate_organiser_*`, `kyc_*`, `vouches_*` (phase **I**, one folder) → four sub-modules of **`trust`**.

## 7. Coverage scoreboard

| Feature module | Designs? | Phone | Tablet | Notes |
|---|---|---|---|---|
| `auth` | ✅ | ✅ | ✅ | missing forgot/reset-password renders |
| `session` | n/a | — | — | no UI by design |
| `dashboard` | ✅ | ✅ | ✅ | 1 phone + 2 tablet variants |
| `pockets` | ✅ | ✅ | ✅ | full set incl. manage/public |
| `adashi` | ✅ | ✅ | ✅ | rotation phone-only render |
| `contributions` | ✅ | ✅ | ◑ | `invoice_history` phone-only |
| `charity` | ✅ | ✅ | ✅ | |
| `plans` | ✅ | ✅ | ✅ | |
| `trust` | ✅ | ✅ | ◑ | some sub-modules tablet-only or phone-only |
| `group_collaboration` | ✅ | ✅ | ✅ | |
| `money` | ✅ | ✅ | ✅ | gateway/checkout undesigned (OFF) |
| `notifications` | ✅ | ✅ | ✅ | |
| `discovery` | ✅ | ◑ | ◑ | `discover_pockets` phone-only; no search screen |
| `gamification` | ✅ | ✅ | ✅ | leaderboard + badges |
| `profile` | ✅ | ✅ | ✗ | no tablet renders |
| `school` | ✅ | ✅ | ✗ | no tablet renders |
| `administration` | ✅ | ✅ | ✗ | no tablet renders |
| **`friends`** | ◑ | ◑ | ◑ | `refer_earn` (invite block) only; friend-graph sections undesigned |
| **`legal`** | ✗ | ✗ | ✗ | Terms/Privacy/consent/delete undesigned |

Legend: ✅ complete · ◑ partial · ✗ missing · n/a not applicable.

---

## 8. How to use this map

- **Starting a feature?** Open its row in §2 → grab the `ui-designs/<phase>/<screen>.png` renders and `.html` references → build the `presentation/pages/*_page.dart` against the routes listed → compose cross-feature widgets per §3.
- **Reviewing a PR?** Check the screen is in the **owning** feature (§2/§6), not a phase-folder-driven misplacement; verify cross-feature pieces come through use cases (§3).
- **Planning design work?** §5 + §7 are the backlog: friends, legal, password-reset, and the missing tablet renders.
- **Assets?** Export from `A_foundation_design_system` into `assets/` and wire tokens into `packages/design_system` (§2 row 1).

*Keep this map in sync: when a new screen is rendered or a feature module changes, update §2 and the §7 scoreboard. When `FLUTTER_ARCHITECTURE.md` gains the `friends`/`legal` modules, move those rows out of §5.*

