contract c12396{
  /**
   * @dev initialize the contract and set token
   */
  function initialize(
      address _sdt,
      address _vestingContract,
      address _icoCostsPool,
      address _distributionContract
  ) public validAddress(_sdt) validAddress(_vestingContract) onlyOwner {
    require(!activated);
    activated = true;
    token = BurnableToken(_sdt);
    vesting = TokenVesting(_vestingContract);
    // 1% reserve is released on deploy
    token.transfer(_icoCostsPool, 7000000 ether);
    token.transfer(_distributionContract, 161000000 ether);
    //early backers allocation
    uint256 threeMonths = vestingStarts.add(90 days);
    updateStats(0, 43387693 ether);
    grantVestedTokens(0x02f807E6a1a59F8714180B301Cba84E76d3B4d06, 22572063 ether, vestingStarts, threeMonths);
    grantVestedTokens(0x3A1e89dD9baDe5985E7Eb36E9AFd200dD0E20613, 15280000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0xA61c9A0E96eC7Ceb67586fC8BFDCE009395D9b21, 250000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0x26C9899eA2F8940726BbCC79483F2ce07989314E, 100000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0xC88d5031e00BC316bE181F0e60971e8fEdB9223b, 1360000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0x38f4cAD7997907741FA0D912422Ae59aC6b83dD1, 250000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0x2b2992e51E86980966c42736C458e2232376a044, 105000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0xdD0F60610052bE0976Cf8BEE576Dbb3a1621a309, 140000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0xd61B4F33D3413827baa1425E2FDa485913C9625B, 740000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0xE6D4a77D01C680Ebbc0c84393ca598984b3F45e3, 505630 ether, vestingStarts, threeMonths);
    grantVestedTokens(0x35D3648c29Ac180D5C7Ef386D52de9539c9c487a, 150000 ether, vestingStarts, threeMonths);
    grantVestedTokens(0x344a6130d187f51ef0DAb785e10FaEA0FeE4b5dE, 967500 ether, vestingStarts, threeMonths);
    grantVestedTokens(0x026cC76a245987f3420D0FE30070B568b4b46F68, 967500 ether, vestingStarts, threeMonths);
  }
}