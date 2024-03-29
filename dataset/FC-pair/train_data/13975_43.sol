contract c13975{
  //distributes reserved tokens. Should be called before finalization
  function distributeReservedTokens(uint reservedTokensDistributionBatch) public {
    assert(msg.sender == address(crowdsale));
    assert(reservedTokensDistributionBatch > 0);
    assert(!reservedTokensAreDistributed);
    assert(distributedReservedTokensDestinationsLen < token.reservedTokensDestinationsLen());
    // How many % of tokens the founders and others get
    uint tokensSold = 0;
    for (uint8 i = 0; i < crowdsale.joinedCrowdsalesLen(); i++) {
      CrowdsaleExt tier = CrowdsaleExt(crowdsale.joinedCrowdsales(i));
      tokensSold = tokensSold.plus(tier.tokensSold());
    }
    uint startLooping = distributedReservedTokensDestinationsLen;
    uint batch = token.reservedTokensDestinationsLen().minus(distributedReservedTokensDestinationsLen);
    if (batch >= reservedTokensDistributionBatch) {
      batch = reservedTokensDistributionBatch;
    }
    uint endLooping = startLooping + batch;
    // move reserved tokens
    for (uint j = startLooping; j < endLooping; j++) {
      address reservedAddr = token.reservedTokensDestinations(j);
      if (!token.areTokensDistributedForAddress(reservedAddr)) {
        uint allocatedBonusInPercentage;
        uint allocatedBonusInTokens = token.getReservedTokens(reservedAddr);
        uint percentsOfTokensUnit = token.getReservedPercentageUnit(reservedAddr);
        uint percentsOfTokensDecimals = token.getReservedPercentageDecimals(reservedAddr);
        if (percentsOfTokensUnit > 0) {
          allocatedBonusInPercentage = tokensSold * percentsOfTokensUnit / 10**percentsOfTokensDecimals / 100;
          token.mint(reservedAddr, allocatedBonusInPercentage);
        }
        if (allocatedBonusInTokens > 0) {
          token.mint(reservedAddr, allocatedBonusInTokens);
        }
        token.finalizeReservedAddress(reservedAddr);
        distributedReservedTokensDestinationsLen++;
      }
    }
    if (distributedReservedTokensDestinationsLen == token.reservedTokensDestinationsLen()) {
      reservedTokensAreDistributed = true;
    }
  }
}