# KeenPocket — Designed-UI Implementation Plan

> **Goal.** Replace the current placeholder presentation with the **designed** UIs in
> `ui-designs/`, driven by the traceability matrix in
> [UI_DESIGN_FEATURE_MAP.md](UI_DESIGN_FEATURE_MAP.md). Two steps: **(1)** evolve the
> shared design system to match the rendered "candy / chunky-tactile" look, then
> **(2)** rebuild each feature's pages against its designs, feature-by-feature.
>
> **Standing constraint.** Presentation layer only. No data/domain work; cubits keep
> their placeholder view-model data. This plan changes *how the UI looks*, not *where
> data comes from*.

---

## Part 1 — Design-system merge (`packages/design_system`)

Both `keenpocket_design_system_1.md` and `_2.md` are Material-3 token dumps for the
same brand (primary `#1cb0f6`, dark `#1899d6`, light `#ddf4ff`, gold). **`_1` is the
base**; from `_2` I add only what `_1` lacks. Where they conflict, `_1` wins.

### What already matches (no change)
- Brand swatch family, gold accent, neutral ramp — `KpColors` already encodes the
  anchors `_1`/`_2` cite (`brand500=#1cb0f6`, `brand600=#1899d6`, `brand50=#ddf4ff`,
  `gold500=#ffd900`).
- Radius scale (`KpRadii`: xs4 / s8 / m12 / l16 / xl24) covers most of the spec.
- Spacing 4px base + semantic names (`KpSpacing`).

### Conflicts — resolved in favour of `_1`
| Token | `_1` (base, wins) | `_2` | Decision |
|---|---|---|---|
| `surface` / `background` | `#f7f9fb` (slate) | `#f9f9ff` (blue) | `#f7f9fb` |
| `on-surface` | `#191c1e` | `#111c2d` | `#191c1e` |
| `secondary` | gold (`#fec700` family) | blue `#006590` | **gold** (gold is the reward accent) |
| `tertiary` | red `#bb1522` | gold | red |
| display headline | 48px / 900 | 32px / 900 | keep `_1`'s display; expose `_2`'s 32 as `display-lg`-equivalent |

### From `_1` — adopt into the app DS
1. **Heavier type weights.** `_1` mandates 800–900 headlines and 600 body. Current
   `KpTypography` uses w600 headlines / w400 body. → Bump headline/title weights to
   w800, body to w600, display to w900, add `-0.02em` tracking on headlines. (Keeps
   `Nunito`; spec says "Nunito Sans" — same family name we ship.)
2. **Candy Button (signature).** 3D pressable: resting state has a 4px darker bottom
   border; on press the button drops 4px and the border collapses. → new
   `KpCandyButton` (or upgrade `KpButton`) backed by a structural-shadow token.
3. **Chunky Card.** White bg, `xl` (24px) radius, **7px** brand-tinted/slate bottom
   border; interactive cards switch the border to brand on focus. → new `KpCard`.
4. **Structural (flat) shadow token.** A solid-block bottom offset 4–7px thick (not a
   blur) + an optional brand-tinted soft glow (`#1cb0f6` @10%, 20–30px blur). → extend
   `KpShadows` with `structural` / `brandGlow`.
5. **Thick inputs.** 2px border, high radius, brand-glow focus. → restyle
   `KpTextField` in the theme's `inputDecorationTheme`.
6. **Dark mode = deep navy.** bg `#141e2a`, surfaces `#202f3e`, brand keeps vibrance,
   shadows shift to deep-blue tint. → fill in `KpTheme.dark` + dark `KpSemanticColors`.

### From `_2` — add only what `_1` omits
1. **`label-caps`** (12px / 800 / uppercase / `0.08em`) and **`nav-button`** (15px /
   800 / uppercase / `0.05em`) text styles — used for buttons + bottom-nav labels.
2. **Card gradient** `linear-gradient(177deg,#ffffff,#f5fbff)` for financial cards —
   add as a `KpGradients.card` token; `KpCard` uses it for the "financial" variant.
3. **Modal/sheet elevation:** soft high-spread shadow `0 10px 25px rgba(30,41,59,.1)`
   and a 22.4px top radius for bottom sheets → `KpRadii.sheet` + `KpShadows.modal`.
4. **Control radius** `~12.8px` (`_2`'s 0.8rem) for buttons/inputs — already close to
   `KpRadii.m` (12); standardise controls on `m`.
5. **Emoji-first category iconography** convention (🏠/🛒 + text label) — documented as
   a usage rule; category chips render an emoji + label.

### Assets to bundle (from `A_foundation_design_system/`)
- `…mr_k….png` → `assets/images/mr_k_wave.png` (mascot — empty/success/loading states)
- `a_3d_gold_coin…png` → `assets/images/keens_coin.png` (Keens currency 🪙)
- `kandfriendsnormal.png` → `assets/images/kandfriends.png` (auth/celebration art)
- Wire into `pubspec.yaml`; add a `KpMascot` widget with mood variants
  (wave / think / celebrate / search) consumed by `KpEmptyView` / `KpErrorView` /
  success states.

### DS deliverables
`kp_colors.dart` (surface ramp + dark navy), `kp_typography.dart` (weights + caps/nav
styles), `kp_shadows.dart` (structural/brandGlow/modal), `kp_radii.dart` (sheet),
`kp_gradients.dart` (new), widgets `kp_card.dart` (new), `kp_candy_button.dart` /
`kp_button.dart`, `kp_text_field.dart`, `kp_mascot.dart` (new), `kp_chip.dart`,
`kp_progress_bar.dart` (thick, recessed). Update `design_system_guide.md` and the
barrel. **Each change keeps the verification loop green** (format / analyze /
custom_lint / test / coverage ≥ 70%).

---

## Part 2 — Feature-by-feature UI rebuild

Order follows **dependencies**: design system → cross-feature shared widgets → primary
tab surfaces → detail/secondary screens → flag-gated/admin. Per §3 of the map, composed
screens (pocket hub, adashi hub, profile, dashboard) are assembled from **reusable
widgets exported by the owning feature** — so those widgets must exist first.

### Wave 0 — Foundation (Part 1 above)
Design system + assets. Nothing else can look right until this lands.

### Wave 1 — Cross-feature shared widgets (the composables of §3)
Built before the hub pages that consume them:
- `trust` → `ReputationChip`, `KycBadge`, `RateOrganiserSheet`, `ReputationBlock`
- `contributions` → `ContributeButton`, `PayFromWalletSheet` (uses `money` VM)
- `charity` → `CharityDonateCard`
- `group_collaboration` → `GroupChatFab` + `GroupChatPanel`, `DisputesSection`
- `pockets` → `PocketShoppingSection` (the `H` screen that belongs to pockets)
- `money` → payout-account selector, `BankAccountsList`

### Wave 2 — Auth + primary tabs (highest-traffic surfaces)
| Feature | Design phase | Key screens |
|---|---|---|
| `auth` | B | splash, onboarding carousel, **login** (`login_updated_mascot` canonical), register, OTP |
| `dashboard` | C | `home_dashboard` (canonical phone) — composes read-only VMs |
| `pockets` | D | `my_pockets` (pick 1 variant), create, **pocket_detail_hub** (assembles Wave-1 widgets) |
| `plans` | H | shopping list / create / detail (Tab 3) |
| `discovery` | M | discover / explore-adashi / insights (Tab 4) |
| `profile` | O | my-profile (composes trust+gamification+money), public-profile, settings (Tab 5) |

### Wave 3 — Core money-circle detail flows
| Feature | Phase | Screens |
|---|---|---|
| `adashi` | E | circles list, **adashi_hub** + rotation stepper, create, manage |
| `contributions` | F | contribute-amount, allocate-months, invoice-history |
| `charity` | G | charity-setup (organiser) + donate card (embedded) |
| `trust` | I | vouches inbox, kyc, rate-organiser, reputation hub |
| `group_collaboration` | J | chat panel, disputes hub |

### Wave 4 — Secondary + flag-gated
| Feature | Phase | Notes |
|---|---|---|
| `notifications` | L | inbox |
| `gamification` | N | leaderboard, badges |
| `friends` | N | `refer_earn` invite block (friend-graph sections undesigned — §5) |
| `money` | K | wallet / payouts — **flag-gated, ships OFF** (FeatureGuard) |
| `school` | P | create / dashboard / my-children — **flag-gated** |
| `administration` | Q | super-admin, health — **permission-gated** |

### Per-screen procedure (every screen)
1. Open `ui-designs/<phase>/<screen>.png` + `.html` reference.
2. Confirm the **owning feature** via map §2/§6 (ignore phase-folder placement).
3. Rebuild the `*_page.dart` using DS components (`KpCard`, `KpCandyButton`, `KpMascot`,
   etc.) against the route in §2. Cubit/VM data stays placeholder (presentation-only).
4. Compose cross-feature pieces via the owning feature's exported widgets (§3) — never
   reach into another feature's internals (architecture dependency rule).
5. Keep/extend tests; run the full verification loop; keep coverage ≥ 70%.

### Conventions / decisions baked in
- **Variants (map §4):** Login/Register → `*_updated_mascot`; Dashboard → `home_dashboard`;
  Pockets list / tablet → pick the brief-closest, others kept as reference only.
- **Tablet:** where renders exist, follow them; where missing (§5: profile, settings,
  school, admin, …) use master-detail per architecture Z6 — tracked, not blocking.
- **Design gaps (§5):** forgot/reset-password, friend-graph, legal/delete, search-results
  remain design-backlog; their features get a faithful placeholder, not a guess.

---

## Sequencing summary
Wave 0 (design system) → Wave 1 (shared composables) → Wave 2 (auth + 5 tabs) →
Wave 3 (adashi/contributions/charity/trust/chat) → Wave 4 (secondary + gated). Each wave
ends green on the verification loop before the next begins.
