# config/

Environment & flavor definitions (non-secret).

- Runtime config is modelled by `AppConfig` (`lib/core/config/app_config.dart`)
  and selected by the flavor entrypoints (`lib/main_dev|staging|prod.dart`).
- **Secrets are never committed.** Inject them at build time via `--dart-define`
  / `--dart-define-from-file` or CI secrets.
- Non-secret defaults (feature-flag defaults, seed data) may live here or under
  `assets/env/` and be read at startup.

| Flavor | Entry point | Base URL (see `AppConfig`) |
|---|---|---|
| dev | `lib/main_dev.dart` | `api.dev.keenpockets.example.com` |
| staging | `lib/main_staging.dart` | `api.staging.keenpockets.example.com` |
| prod | `lib/main_prod.dart` | `api.keenpockets.example.com` |

Example (secret injection):

```bash
flutter run -t lib/main_staging.dart --flavor staging \
  --dart-define-from-file=config/staging.secrets.json   # gitignored
```
