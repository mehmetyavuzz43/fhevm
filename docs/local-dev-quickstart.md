# Local Development Quickstart

This guide summarizes the minimal steps for running FHEVM examples in a local environment.

## 1. Clone and install

    git clone https://github.com/zama-ai/fhevm.git
    cd fhevm
    pnpm install

Make sure your Node.js and pnpm versions match the ones recommended in the main README.

## 2. Run against the mock environment

When experimenting locally, it is usually safer to use the mock FHEVM runtime:

    pnpm hardhat test --network fhevm_mock

This allows you to iterate quickly without relying on a public testnet.

## 3. Using the Sepolia testnet

If you want to run examples against Sepolia:

1. Configure your RPC endpoint and private key in your environment.
2. Export the variables before running Hardhat:

       export SEPOLIA_RPC_URL="https://sepolia.example"
       export SEPOLIA_PRIVATE_KEY="0xYOUR_KEY"

3. Run tests or scripts:

       pnpm hardhat test --network sepolia

## 4. Recommended next steps

- Start with the simple examples in `examples/` before deploying your own contracts.
- Keep mock tests passing before switching to real networks.
- When in doubt, prefer the mock runtime: it is faster and cheaper to iterate on.
