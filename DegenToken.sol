// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        // Assign initial ownership to deployer (msg.sender)
    }

    // Mint tokens to a specific address. Only the owner can mint.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens from the sender's account
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Redeem tokens from a player's account. Only the owner can redeem tokens.
    function redeem(address from, uint256 amount) public onlyOwner {
        _transfer(from, owner(), amount);
    }
}
