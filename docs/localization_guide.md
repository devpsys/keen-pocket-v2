# Localization Guide

All user-facing text is localized with **ARB + `flutter gen-l10n`**. Hardcoded
strings in widgets are rejected by `no_hardcoded_strings`.

## Files
- `lib/core/localization/arb/app_en.arb` — template (source of truth).
- `lib/core/localization/arb/app_es.arb` — example translation.
- `lib/core/localization/generated/` — generated `AppLocalizations` (do not edit).
- `lib/core/localization/l10n_extension.dart` — `context.l10n` accessor.
- `l10n.yaml` — generator config.

## Add a string
1. Add the key (+ `@key` metadata) to `app_en.arb`:
   ```json
   "greeting": "Hello, {name}!",
   "@greeting": {
     "description": "Home header",
     "placeholders": { "name": { "type": "String" } }
   }
   ```
2. Add the same key to every other `app_*.arb`.
3. Regenerate: `flutter gen-l10n` (also runs on `flutter pub get`).
4. Use it: `context.l10n.greeting('Ada')`.

## ✅ Correct
```dart
Text(context.l10n.login)
KpButton(label: context.l10n.submit, onPressed: ...)
```

## ❌ Incorrect
```dart
Text('Login')        // no_hardcoded_strings
Text('Submit')       // no_hardcoded_strings
```

## Localizing failures
Domain `Failure`s carry non-localized messages. Convert at the UI boundary:
```dart
Text(failure.localizedMessage(context));   // maps Failure → l10n key
```
See `core/error/failure_localizer.dart`.

## Adding a locale
1. Create `app_<locale>.arb` with all keys.
2. Run `flutter gen-l10n`. `AppLocalizations.supportedLocales` updates
   automatically and `MaterialApp` already wires the delegates.
