# TokenDegen Contract

## Overview

The `TokenDegen` contract is an ERC20 token smart contract deployed on the Ethereum blockchain. It includes functionalities for managing tokens, minting tokens for buyers, transferring tokens between users, redeeming collectible items, and checking token balances. This contract also integrates ownership management using the Ownable pattern from OpenZeppelin.

## Description

The `TokenDegen` contract consists of the following key components:

- **Token Details**: Deployed with the name "Degen" and symbol "DGN".
- **Token Minting**: Functionality to mint tokens for buyers who have joined a purchase queue.
- **Token Transfer**: Ability for users to transfer tokens to others.
- **Collectible Redemption**: Allows users to redeem various collectible items based on their token balance.
- **Token Burning**: Functionality to burn tokens when users redeem collectibles.
- **Ownership**: Implements the Ownable pattern, allowing the contract owner to perform administrative functions such as minting tokens.

This contract demonstrates usage of ERC20 standard functions, integration with OpenZeppelin's ERC20 and Ownable contracts, as well as state management using mappings and arrays.

## Getting Started

### Executing Program

To interact with the `TokenDegen` contract, follow these steps using Remix, an online Solidity IDE:

1. **Access Remix:**
   - Go to [Remix IDE](https://remix.ethereum.org/).

2. **Create and Save File:**
   - Click on the "+" icon in the left-hand sidebar to create a new file.
   - Save the file with a .sol extension (e.g., `TokenDegen.sol`).

3. **Code:**
   - Write the provided Solidity code into the file.
     
4. **Compile Code:**
   - Switch to the "Solidity Compiler" tab in Remix.
   - Set the "Compiler" option to "0.8.24" (or another compatible version).
   - Click on "Compile TokenDegen.sol" to compile the contract.

5. **Deploy Contract:**
   - Navigate to the "Deploy & Run Transactions" tab in Remix.
   - Select the "TokenDegen" contract from the dropdown menu.
   - Click on the "Deploy" button to deploy the contract.

6. **Interact with Contract:**
   - Once deployed, interact with the contract:
     - Use the `mintTokens` function (onlyOwner) to mint tokens for buyers in the queue.
     - Use the `transferTokens` function to transfer tokens to another address.
     - Use the `redeemCollectibles` function to redeem collectibles with your tokens.
     - Use the `burnTokens` function to burn tokens.
     - Use the `getBalance` function to check your token balance.

7. **Verify the Contract on Snowtrace**
   - Verify the contract.
   - Go to Snowtrace.
   - Search for your contract using the deployed contract address.
   - Follow the instructions to verify and publish the contract. You will need the source code, compiler version, and contract name.

## Authors

-- Ambesh Dubey

## License

This project is licensed under the MIT License - see the LICENSE file for details.
