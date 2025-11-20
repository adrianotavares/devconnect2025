# devconnect2025

A basic Solidity repository using Hardhat 3 and TypeScript.

## Project Structure

```
devconnect2025/
├── contracts/          # Solidity smart contracts
│   └── Counter.sol     # Sample Counter contract
├── test/              # Test files
│   └── Counter.ts     # Tests for Counter contract
├── scripts/           # Deployment and utility scripts
│   └── send-op-tx.ts  # Example script for OP transactions
├── ignition/          # Hardhat Ignition deployment modules
│   └── modules/
│       └── Counter.ts # Deployment configuration for Counter
├── hardhat.config.ts  # Hardhat configuration
├── tsconfig.json      # TypeScript configuration
└── package.json       # Project dependencies
```

## Features

- **Hardhat 3 Beta**: Latest version of Hardhat development environment
- **TypeScript**: Full TypeScript support for contracts and tests
- **Viem**: Modern Ethereum library for contract interactions
- **Testing**: Built-in test framework using Node Test Runner
- **Sample Contract**: Counter contract with events and tests
- **Deployment**: Hardhat Ignition for declarative deployments

## Getting Started

### Prerequisites

- Node.js 22.10.0 or later (LTS)
- npm or yarn

### Installation

```bash
npm install
```

### Available Commands

```bash
# Compile contracts
npm run compile

# Run tests
npm run test

# Start local Hardhat network
npm run node
```

## Smart Contracts

### Counter Contract

A simple counter contract located in `contracts/Counter.sol` that demonstrates:
- State variables
- Public functions
- Event emissions
- Input validation

## Testing

Tests are written in TypeScript using Node's built-in test runner and Viem for contract interactions. Run tests with:

```bash
npm run test
```

## Deployment

Deployment modules are defined in `ignition/modules/` using Hardhat Ignition. This provides a declarative way to deploy and manage contract deployments.

## Configuration

### Networks

The `hardhat.config.ts` includes configuration for:
- `hardhatMainnet`: Simulated L1 network
- `hardhatOp`: Simulated OP Stack network  
- `sepolia`: Ethereum Sepolia testnet (requires RPC URL and private key)

### Solidity Version

The project uses Solidity 0.8.28 with optimization enabled in production profile.

## License

ISC
