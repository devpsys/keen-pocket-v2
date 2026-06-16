#!/usr/bin/env bash
# Fails if line coverage in coverage/lcov.info is below the threshold.
#
# Excludes generated code and composition-root/wiring files that are exercised
# by integration/run-time, not unit tests:
#   *.g.dart / *.freezed.dart / *.config.dart, anything under /generated/,
#   DI registration (core/di, network_module) and the app entry point (app/, main).
# Path matching is separator-agnostic (works with Windows '\' and POSIX '/').
set -euo pipefail

THRESHOLD="${1:-80}"
LCOV="coverage/lcov.info"

if [[ ! -f "$LCOV" ]]; then
  echo "✗ $LCOV not found. Run: flutter test --coverage"
  exit 1
fi

read -r hit total < <(awk '
  /^SF:/ {
    f = substr($0, 4); gsub(/\\/, "/", f)
    excluded = (f ~ /(\.g|\.freezed|\.config)\.dart$/) ||
               (f ~ /\/generated\//) ||
               (f ~ /\/core\/di\//) ||
               (f ~ /\/core\/network\/network_module\.dart$/) ||
               (f ~ /\/app\//) ||
               (f ~ /\/main\.dart$/)
  }
  /^DA:/ && !excluded { total++; if ($0 !~ /,0$/) hit++ }
  END { print hit "  " total }
' "$LCOV")

if [[ "${total:-0}" -eq 0 ]]; then
  echo "✗ No coverage data found."
  exit 1
fi

pct=$(awk "BEGIN { printf \"%.2f\", ($hit/$total)*100 }")
echo "Coverage: ${pct}% (${hit}/${total} lines) — threshold ${THRESHOLD}%"

below=$(awk "BEGIN { print ($pct < $THRESHOLD) ? 1 : 0 }")
if [[ "$below" -eq 1 ]]; then
  echo "✗ Coverage below threshold."
  exit 1
fi
echo "✓ Coverage meets threshold."
