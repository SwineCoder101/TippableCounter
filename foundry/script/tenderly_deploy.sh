#!/bin/bash

# Deploy to Tenderly
DEVNET_BASE_RPC=https://rpc.vnet.tenderly.co/devnet/base-devnet/f4828c58-31dd-4902-baed-5f44087cc7a9

forge create --rpc-url=$DEVNET_BASE_RPC ./src/TippableCounter.sol:TippableCounter --unlocked --from 0x0000000000000000000000000000000000000000
