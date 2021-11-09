// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

// Author: Khashkhuu 'Xass1on' Gankhuyag

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MICToken is ERC20, Ownable {
    using SafeMath for uint256;
    TokenTimelock public teamTimelock;

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
        0x3F35473075Bc28e632a881a19E271C12c7f48c8E;
    address constant _tokenOfferAddress =
        0x3F35473075Bc28e632a881a19E271C12c7f48c8E;
    address constant _tokenTeamReserveAddress =
        0xB6Bad08ad4ae5F4b9a6A5f4076C37655D281f37f;
    address constant _tokenLoyaltyAddress =
        0x3340Da47BFf41B85C925Ea840E81a45a84A6a1a1;
    address constant _tokenStrategicReserveAddress =
        0xb43689fD00b0EC09cc9971741F642519329FE9c4;
    address constant _tokenLiquidityAddress =
        0x36f980FF1719A51EE03c7EDEBfaF74c25E37d65C;
    address constant _tokenMarketingAddress =
        0x36f980FF1719A51EE03c7EDEBfaF74c25E37d65C;

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
        _mint(_tokenLiquidityAddress, _tokenLiquidity * 10**18);

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
