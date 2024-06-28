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
   - Write the provided Solidity code into the file:

     ```solidity
     // SPDX-License-Identifier: MIT
     pragma solidity ^0.8.24;

     import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
     import "@openzeppelin/contracts/access/Ownable.sol";
     import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

     contract TokenDegen is ERC20, Ownable, ERC20Burnable {
         constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

         // Enum for collectible items
         enum Collectibles {Common, Uncommon, Rare, UltraRare, Legendary}

         struct Buyer {
             address buyerAddress;
             uint quantity;
         }
         // Queue for buyers wanting to purchase TokenDegen
         Buyer[] public buyerQueue;

         struct UserCollectibles {
             uint common;
             uint uncommon;
             uint rare;
             uint ultraRare;
             uint legend;
         }

         // Mapping to store redeemed collectibles
         mapping(address => UserCollectibles) public userCollectibles;

         function purchaseTokens(address _buyerAddress, uint _quantity) public {
             buyerQueue.push(Buyer({buyerAddress: _buyerAddress, quantity: _quantity}));
         }

         // Mint tokens for buyers in the queue
         function mintTokens() public onlyOwner {
             // Loop to mint tokens for buyers in the queue
             while (buyerQueue.length != 0) {
                 uint index = buyerQueue.length - 1;
                 if (buyerQueue[index].buyerAddress != address(0)) { // Check for non-zero address
                     _mint(buyerQueue[index].buyerAddress, buyerQueue[index].quantity);
                     buyerQueue.pop();
                 }
             }
         }
         
         // Transfer tokens to another user
         function transferTokens(address _recipient, uint _quantity) public {
             require(_quantity <= balanceOf(msg.sender), "Insufficient balance");
             _transfer(msg.sender, _recipient, _quantity);
         }

         // Redeem different collectibles
         function redeemCollectibles(Collectibles _collectible) public {
             if (_collectible == Collectibles.Common) {
                 require(balanceOf(msg.sender) >= 15, "Insufficient balance");
                 userCollectibles[msg.sender].common += 1;
                 burn(15);
             } else if (_collectible == Collectibles.Uncommon) {
                 require(balanceOf(msg.sender) >= 25, "Insufficient balance");
                 userCollectibles[msg.sender].uncommon += 1;
                 burn(25);
             } else if (_collectible == Collectibles.Rare) {
                 require(balanceOf(msg.sender) >= 35, "Insufficient balance");
                 userCollectibles[msg.sender].rare += 1;
                 burn(35);
             } else if (_collectible == Collectibles.UltraRare) {
                 require(balanceOf(msg.sender) >= 45, "Insufficient balance");
                 userCollectibles[msg.sender].ultraRare += 1;
                 burn(45);
             } else if (_collectible == Collectibles.Legendary) {
                 require(balanceOf(msg.sender) >= 60, "Insufficient balance");
                 userCollectibles[msg.sender].legend += 1;
                 burn(60);
             } else {
                 revert("Invalid collectible selected");
             }
         }

         // Function to burn tokens
         function burnTokens(address _holder, uint _quantity) public {
             _burn(_holder, _quantity);
         }

         // Function to check the balance of tokens
         function getBalance() public view returns (uint) {
             return balanceOf(msg.sender);
         }
     }
     ```

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
     - Use the `purchaseTokens` function to add yourself to the buyer queue.
     - Use the `mintTokens` function (onlyOwner) to mint tokens for buyers in the queue.
     - Use the `transferTokens` function to transfer tokens to another address.
     - Use the `redeemCollectibles` function to redeem collectibles with your tokens.
     - Use the `burnTokens` function to burn tokens.
     - Use the `getBalance` function to check your token balance.

## Authors

- Ambesh Dubey

## License

This project is licensed under the MIT License - see the LICENSE file for details.
