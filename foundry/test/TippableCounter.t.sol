// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {TippableCounter} from "../src/TippableCounter.sol";

contract CounterTest is Test {
    TippableCounter tippableCounter = new TippableCounter();
    address alice = address(1);
    address bob = address(2);

    function setUp() public {
     // initialize account balances
        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
    }

    function testFuzz_increment(uint8 amount) public {
        vm.assume(amount >= 1);
        vm.assume(amount <= 10);
        vm.prank(alice);
        tippableCounter.increment{value: 0.01 ether}(amount);
    }

    // function test_increment() public {
    //     vm.prank(alice);
    //     tippableCounter.increment{value: 0.01 ether}(1);
    //     require(tippableCounter.counter() == 1);
    //     require(address(tippableCounter).balance == 0.01 ether);
    // }

    function testFail_incrementTooHigh() public {
        vm.prank(alice);
        tippableCounter.increment{value: 0.01 ether}(11);
        vm.expectRevert("incrementBy not in range.");
    }

    function testFail_incrementNoValue() public {
        vm.prank(alice);
        tippableCounter.increment{value: 0 ether}(1);
        vm.expectRevert("Fee required.");
    }
}