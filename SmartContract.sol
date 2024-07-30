// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomNumberGenerator {
    uint256 private nonce;

    constructor() {
        nonce = 0;
    }

    // Generate a random number
    function getRandomNumber(uint256 max) public returns (uint256) {
        // Combine various block attributes and nonce to create a pseudo-random hash
        uint256 randomHash = uint256(keccak256(abi.encodePacked(
            block.timestamp,  // Current block timestamp
            block.difficulty, // Difficulty of the block
            msg.sender,       // Address of the sender
            nonce             // A nonce to ensure different outputs
        )));
        
        // Increment the nonce
        nonce++;

        // Modulo operation to limit the number within the specified range
        return randomHash % max;
    }
}
