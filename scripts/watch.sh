#!/usr/bin/env bash
# Continuous code generation during development.
set -euo pipefail
dart run build_runner watch --delete-conflicting-outputs
