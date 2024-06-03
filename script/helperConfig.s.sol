// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

//If on local use mock address otw grab the live addresses from the chain we are using

contract helperConfig {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliEthConfig() public pure returns (NetworkConfig memory) {
        // Price feed address, vrf address, gas price ...
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {
        // Price feed address, vrf address, gas price ...
    }
}
