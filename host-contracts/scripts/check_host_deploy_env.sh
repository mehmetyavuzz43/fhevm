#!/usr/bin/env bash
set -euo pipefail

# Sanity checks for a host-chain deployment environment used with FHEVM host contracts.
#
# This script verifies that a minimal set of environment variables is present
# before running deployment or migration scripts.
#
# Required:
#   FHEVM_HOST_RPC_URL      - RPC endpoint of the host chain
#   FHEVM_HOST_CHAIN_ID     - chain ID of the host chain
#   FHEVM_HOST_DEPLOYER_KEY - private key of the deployer account (DO NOT hardcode in code)
#
# Exit codes:
#   0 - configuration looks good
#   1 - one or more required variables are missing

REQUIRED_VARS=(
  "FHEVM_HOST_RPC_URL"
  "FHEVM_HOST_CHAIN_ID"
  "FHEVM_HOST_DEPLOYER_KEY"
)

missing=()

for var in "${REQUIRED_VARS[@]}"; do
  value="${!var:-}"
  if [ -z "${value}" ]; then
    missing+=("${var}")
  fi
done

if [ "${#missing[@]}" -ne 0 ]; then
  echo "[host-contracts] Missing required environment variables:" >&2
  for var in "${missing[@]}"; do
    echo "  - ${var}" >&2
  done
  echo "[host-contracts] Please export these variables before running host contract deployment scripts." >&2
  exit 1
fi

echo "[host-contracts] Host deployment environment looks good:"
for var in "${REQUIRED_VARS[@]}"; do
  echo "  - ${var} is set"
done
