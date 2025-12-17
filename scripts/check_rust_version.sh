#!/usr/bin/env bash
set -euo pipefail

# Small helper script to print the current Rust toolchain version.

if ! command -v rustc >/dev/null 2>&1; then
  echo "rustc is not installed or not on PATH."
  exit 1
fi

if ! command -v cargo >/dev/null 2>&1; then
  echo "cargo is not installed or not on PATH."
  exit 1
fi

echo "rustc version:"
rustc --version

echo
echo "cargo version:"
cargo --version
