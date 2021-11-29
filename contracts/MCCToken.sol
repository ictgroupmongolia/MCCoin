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
    TokenTimelock public wcPlatformTimelock;
    TokenTimelock public liquidityTimelock;
    TokenTimelock public investorReserveTimelock1;
    TokenTimelock public investorReserveTimelock2;
    TokenTimelock public investorReserveTimelock3;
    TokenTimelock public investorReserveTimelock4;

    uint256 constant _totalSupply = 5 * 10**11;

    uint256 constant _tokenToOffer = 7.5 * 10**10;
    uint256 constant _tokenTeamReserve = 2.5 * 10**10;
    uint256 constant _tokenWCPlatform = 1.5 * 10**11;

    uint256 constant _tokenAirdrop = 5 * 10**10;
    uint256 constant _tokenStrategicReserve = 5 * 10**10;
    uint256 constant _tokenLiquidity = 5 * 10**10;

    uint256 constant _tokenMarketing = 2.5 * 10**10;
    uint256 constant _tokenStaking = 5 * 10**10;
    uint256 constant _tokenInvestorReserve1 = 6.25 * 10**9;

    uint256 constant _tokenInvestorReserve2 = 6.25 * 10**9;
    uint256 constant _tokenInvestorReserve3 = 6.25 * 10**9;
    uint256 constant _tokenInvestorReserve4 = 6.25 * 10**9;

    string constant _tokenName = "Mongolia Cashmere Coin";
    string constant _tokenSymbol = "MCC";

    address constant _tokenOfferAddress =
        0xf715Fdce9e74D5FA4638Fc57d0DDdb43d7D78C69;
    address constant _tokenTeamReserveAddress =
        0x4c57BaA020291DB0a49255EaAa029863f6913eeF;
    address constant _tokenWCPlatformAddress =
        0x89FAB2d3F22D602B8f4Ec11373413201471a5ED2;

    address constant _tokenAirdropAddress =
        0xd03B501b29D31de01567fC6058cc8988f25D104E;
    address constant _tokenStrategicReserveAddress =
        0x4562eDa025754FC56c1c6Cd1b3dd946b36B8f5ed;
    address constant _tokenLiquidityAddress =
        0x4616F3b5eb6DA9134AA31422F2Ab1E1de35c5d21;

    address constant _tokenMarketingAddress =
        0x1A2FBCd56e9225137577DEA5fB1A651154540581;
    address constant _tokenStakingAddress =
        0xa0A49813dB0B278D3a56be7712DF44177b8BD8dd;
    address constant _tokenInvestorReserveAddress1 =
        0xd14Be6f9e08F3a9334f2B55c03C3AA1e702e642F;

    address constant _tokenInvestorReserveAddress2 =
        0x930BEcAD57Ca2d0395b4097Ba3ad98Ed2c354996;
    address constant _tokenInvestorReserveAddress3 =
        0x963148e2512679049085789151d7B5d26CE0bcAD;
    address constant _tokenInvestorReserveAddress4 =
        0x9c5FDe77fD0280b51C4100E3316D9C96AcB6E66E;

    constructor() ERC20(_tokenName, _tokenSymbol) {
        // ICO
        _mint(_tokenOfferAddress, _tokenToOffer * 10**18);

        // Founders, team and advisors
        teamTimelock = new TokenTimelock(
            this,
            _tokenTeamReserveAddress,
            block.timestamp + 60 * 60 * 24 * 365 * 1
        );
        _mint(address(teamTimelock), _tokenTeamReserve * 10**18);

        // World Cashmere Platform
        wcPlatformTimelock = new TokenTimelock(
            this,
            _tokenWCPlatformAddress,
            block.timestamp + 60 * 60 * 24 * 365 * 5
        );
        _mint(address(wcPlatformTimelock), _tokenWCPlatform * 10**18);

        // Airdrop
        _mint(_tokenAirdropAddress, _tokenAirdrop * 10**18);

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

        // Strategic Investor Reserve
        _mint(_tokenStakingAddress, _tokenStaking * 10**18);

        // Marketing
        investorReserveTimelock1 = new TokenTimelock(
            this,
            _tokenWCPlatformAddress,
            block.timestamp + 60 * 60 * 24 * 91
        );
        _mint(address(investorReserveTimelock1), _tokenWCPlatform * 10**18);

        investorReserveTimelock2 = new TokenTimelock(
            this,
            _tokenWCPlatformAddress,
            block.timestamp + 60 * 60 * 24 * 182
        );
        _mint(address(investorReserveTimelock2), _tokenWCPlatform * 10**18);

        investorReserveTimelock3 = new TokenTimelock(
            this,
            _tokenWCPlatformAddress,
            block.timestamp + 60 * 60 * 24 * 273
        );
        _mint(address(investorReserveTimelock3), _tokenWCPlatform * 10**18);

        investorReserveTimelock4 = new TokenTimelock(
            this,
            _tokenWCPlatformAddress,
            block.timestamp + 60 * 60 * 24 * 365
        );
        _mint(address(investorReserveTimelock4), _tokenWCPlatform * 10**18);
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
