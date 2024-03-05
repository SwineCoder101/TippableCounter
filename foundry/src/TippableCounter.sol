// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "lib/solmate/src/auth/Owned.sol";

contract TippableCounter is Owned {
    uint256 public counter;

    event Incremented(address indexed sender, uint8 incrementedBy, uint256 ethSent);

    constructor() Owned(msg.sender) {}

    function increment(uint8 incrementBy) external payable {
        require(msg.value >= 0.001 ether, "Fee required.");
        require(incrementBy >= 1 && incrementBy <= 10, "incrementBy not in range.");
        counter += incrementBy;

        emit Incremented(msg.sender, incrementBy, msg.value);
    }

    function withdraw() external onlyOwner {
        counter = 0;
        (bool sent,) = address(owner).call{value: address(this).balance}("");
    }
}