#!/usr/bin/env bash
# One-shot code generation (freezed, json_serializable, injectable) + l10n.
set -euo pipefail

echo "▶ flutter pub get"
flutter pub get

echo "▶ gen-l10n"
flutter gen-l10n

echo "▶ build_runner"
dart run build_runner build --delete-conflicting-outputs

echo "✓ Generation complete"
