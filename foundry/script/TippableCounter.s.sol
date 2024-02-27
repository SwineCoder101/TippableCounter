// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {TippableCounter} from "../src/TippableCounter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        TippableCounter tippableCounter = new TippableCounter();
        vm.stopBroadcast();
    }
}