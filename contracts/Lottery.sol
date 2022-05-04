// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract Lottery {
    address payable[] public players;
    uint256 public usdEntryFee;
    AggregatorV3Interface internal ethUsdPriceFeed;

    constructor(address _priceFeedAddress) public {
        usdEntryFee = 50 * (10**18);
        ethUsdPriceFeed = AggregatorV3Interface(_priceFeedAddress);
    }

    function enter() public payable{
        players.push(msg.sender);
    }

    function getEntranceFee() public view returns (uint256) {
        (,int256 price,,,) = ethUsedPriceFeed.latestRoundData();
        uint256 adjustedPrice = uint256(price) * 10**10; // 18 decimals
        // &50, $2,000 / ETH
        // 50/2,000
        // 50 * 10000 / 2000
        uint256 constToEnter = (usdEntryFee * 10**18) / price;
        return costToEnter;
    }

    function startLottery() public{}

    function endLottery() public {}
}