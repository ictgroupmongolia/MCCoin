// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Author: Khashkhuu 'Xass1on' Gankhuyag

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MICToken is ERC20, Ownable {
    using SafeMath for uint256;
    TokenTimelock public teamTimelock;
    TokenTimelock public liquidityTimelock;

    uint256 constant _totalSupply = 520000000000;

    uint256 constant _tokenBrand = 156000000000;
    uint256 constant _tokenToOffer = 83200000000;
    uint256 constant _tokenTeamReserve = 20800000000;
    uint256 constant _tokenLoyalty = 52000000000;
    uint256 constant _tokenStrategicReserve = 46800000000;
    uint256 constant _tokenLiquidity = 52000000000;
    uint256 constant _tokenMarketing = 57200000000;

    string constant _tokenName = "Mongolia Cashmere Coin";
    string constant _tokenSymbol = "MCC";

    address constant _tokenBrandAddress =
        0x2a5a1fb2e243aedaC563d07eC7629FB2eFc92180;
    address constant _tokenOfferAddress =
        0xE502aC45A619d2202e206Cd5968E56033d29f47a;
    address constant _tokenTeamReserveAddress =
        0x856b5a3EAAe59109Cc573bcd9fa4ac34714C7264;
    address constant _tokenLoyaltyAddress =
        0x2F03e43d3647cC8E7C173E1C8b8D93A373889997;
    address constant _tokenStrategicReserveAddress =
        0x3C2AbcB51Ff25A145B5905def1284bF159916c87;
    address constant _tokenLiquidityAddress =
        0x530D1aCb8896E4f6214Ba6D45C42420aC64A2D39;
    address constant _tokenMarketingAddress =
        0xDadBAF111c24EbB4513FA84f16aeA1595a619FfA;

    constructor() ERC20(_tokenName, _tokenSymbol) {
        // Brand
        _mint(_tokenBrandAddress, _tokenBrand * 10**18);

        // IEO
        _mint(_tokenOfferAddress, _tokenToOffer * 10**18);

        // Founders, team and advisors
        teamTimelock = new TokenTimelock(
            this,
            _tokenTeamReserveAddress,
            block.timestamp + 60 * 60 * 24 * 365 * 1
        );
        _mint(address(teamTimelock), _tokenTeamReserve * 10**18);

        // Loyalty
        _mint(_tokenLoyaltyAddress, _tokenLoyalty * 10**18);

        // Strategic resource
        _mint(_tokenStrategicReserveAddress, _tokenStrategicReserve * 10**18);

        // Liquidity
        liquidityTimelock = new TokenTimelock(
            this,
            _tokenLiquidityAddress,
            block.timestamp + 60 * 60 * 24 * 365 * 10
        );
        _mint(address(liquidityTimelock), _tokenLiquidity * 10**18);

        // Marketing
        _mint(_tokenMarketingAddress, _tokenMarketing * 10**18);
    }

    fallback() external payable {
        revert();
    }

    receive() external payable {
        revert();
    }

    function burn() public pure {
        revert();
    }

    function operatorBurn() public pure {
        revert();
    }
}
