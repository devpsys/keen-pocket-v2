#!/usr/bin/env bash
# Point git at the versioned hooks and make them executable.
set -euo pipefail
git config core.hooksPath .githooks
chmod +x .githooks/* 2>/dev/null || true
echo "✓ Git hooks installed (core.hooksPath = .githooks)"
