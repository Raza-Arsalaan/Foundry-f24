// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {helperConfig} from "script/helperConfig.s.sol";

contract DeployFundMe is Script {
    helperConfig helperconfig = new helperConfig();
    address ethToUsdPriceFeed = helperconfig.activeNetworkConfig();

    function run() external returns (FundMe) {
        vm.startBroadcast();
        FundMe fundme = new FundMe(ethToUsdPriceFeed);
        vm.stopBroadcast();
        return fundme;
    }
}
