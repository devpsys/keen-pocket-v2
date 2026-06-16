#!/usr/bin/env bash
# Full local quality gate — mirrors the CI pipeline. Run before pushing.
set -euo pipefail

echo "▶ Format check"
dart format --set-exit-if-changed .

echo "▶ Analyze (app)"
flutter analyze

echo "▶ Analyze (architecture_linter package)"
( cd packages/architecture_linter && dart analyze )

echo "▶ Custom architecture lints"
dart run custom_lint

echo "▶ Tests + coverage"
flutter test --coverage

echo "✓ All checks passed"
