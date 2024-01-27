contract c7017{
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
    uint256 tokenId = xcertKyc.tokenOfOwnerByIndex(msg.sender, balance - 1);
    uint256 kycLevel = uint(xcertKyc.tokenDataValue(tokenId, 0));
    if (isInTimeRange(startTimePresale, startTimeSaleWithBonus)) {
      require(kycLevel > 1);
      require(msg.value >= minimumPresaleWeiDeposit);
      tokens = getTokenAmount(msg.value, bonusPresale);
      require(zxcSold.add(tokens) <= preSaleZxcCap);
    }
    else if (isInTimeRange(startTimeSaleWithBonus, startTimeSaleNoBonus)) {
      require(kycLevel > 0);
      tokens = getTokenAmount(msg.value, bonusSale);
    }
    else if (isInTimeRange(startTimeSaleNoBonus, endTime)) {
      require(kycLevel > 0);
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