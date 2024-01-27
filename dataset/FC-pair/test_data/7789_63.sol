contract c7789{
  /**
   * @dev Low level token purchase function.
   */
  function buyTokens()
    public
    payable
  {
    uint256 tokens;
    // Sender needs Xcert KYC token.
    uint256 balance = xcertKyc.balanceOf(msg.sender);
    require(balance > 0);
    if (isInTimeRange(startTimePresale, startTimeSaleWithBonus)) {
      uint256 tokenId = xcertKyc.tokenOfOwnerByIndex(msg.sender, balance.sub(1));
      uint256 kycLevel = uint(xcertKyc.tokenDataValue(tokenId, 0));
      require(kycLevel > 1);
      require(msg.value >= minimumPresaleWeiDeposit);
      tokens = getTokenAmount(msg.value, bonusPresale);
      require(tokens <= preSaleZxcCap);
    }
    else if (isInTimeRange(startTimeSaleWithBonus, startTimeSaleNoBonus)) {
      tokens = getTokenAmount(msg.value, bonusSale);
    }
    else if (isInTimeRange(startTimeSaleNoBonus, endTime)) {
      tokens = getTokenAmount(msg.value, uint256(0));
    }
    else {
      revert("Purchase outside of token sale time windows");
    }
    require(zxcSold.add(tokens) <= crowdSaleZxcSupply);
    zxcSold = zxcSold.add(tokens);
    wallet.transfer(msg.value);
    require(token.transferFrom(token.owner(), msg.sender, tokens));
    emit TokenPurchase(msg.sender, msg.sender, msg.value, tokens);
  }
}