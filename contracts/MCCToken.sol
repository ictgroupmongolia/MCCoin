// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Author: Khashkhuu 'Xass1on' Gankhuyag

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MCCToken is ERC20, Ownable {
    using SafeMath for uint256;
    TokenTimelock public teamTimelock;
    TokenTimelock public liquidityTimelock;

    uint256 constant _totalSupply = 5.2 * 10**11;

    uint256 constant _tokenBrand = 1.56 * 10**11;
    uint256 constant _tokenToOffer = 8.32 * 10**10;
    uint256 constant _tokenSecondaryMarket = 5.2 * 10**10;
    uint256 constant _tokenTeamReserve = 2.08 * 10**10;
    uint256 constant _tokenLoyalty = 5.2 * 10**10;
    uint256 constant _tokenStrategicReserve = 4.68 * 10**10;
    uint256 constant _tokenLiquidity = 5.2 * 10**10;
    uint256 constant _tokenMarketing = 5.72 * 10**10;

    string constant _tokenName = "Mongolia Cashmere Coin";
    string constant _tokenSymbol = "MCC";

    address constant _tokenBrandAddress =
        0x1D498C6c475aCcE6B5F006534ED1D88B4810fCeB;
    address constant _tokenOfferAddress =
        0x602fCb3Ba09177e16F3cb2e0e68B390F8c6ED097;
    address constant _tokenSecondaryAddress =
        0xF45047484C32Ed78cA832E2BBc26eda25B45EAd5;
    address constant _tokenTeamReserveAddress =
        0x3C8485aCB5ed730b8f176F23A01ec594bb063027;
    address constant _tokenLoyaltyAddress =
        0x891926f9f79268986C6Ce34c4d270d078caEC654;
    address constant _tokenStrategicReserveAddress =
        0x33B634722cc6Fc473e5c57944583fd57db4a21d9;
    address constant _tokenLiquidityAddress =
        0xed94c056b8d7D4a818Be3BeA91AC7FC09a0AB85F;
    address constant _tokenMarketingAddress =
        0x1E3150aBfb78E5bae6bD08f3a2b203b751679340;

    constructor() ERC20(_tokenName, _tokenSymbol) {
        // Brand
        _mint(_tokenBrandAddress, _tokenBrand * 10**18);

        // IEO
        _mint(_tokenOfferAddress, _tokenToOffer * 10**18);

        // Secondary market
        _mint(_tokenSecondaryAddress, _tokenSecondaryMarket * 10**18);

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
