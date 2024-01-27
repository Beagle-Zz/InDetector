contract c3284{
  // rates for each tier and total wei in that tiers
  // they are added up together
  function initTiers(uint256[] rates, uint256[] totalWeis) public onlyWhitelisted returns(uint256) {
    require(token.controller() == address(this));
    require(!tiersInitialized);
    require(rates.length == totalTiers && rates.length == totalWeis.length);
    uint256 tierMax = 0;
    for (uint8 i=0; i < totalTiers; i++) {
      require(totalWeis[i] > 0 && rates[i] > 0);
      tierMax = tierMax.add(totalWeis[i]);
      tiers[i] = Tier({
        rate: rates[i],
        max: tierMax
      });
    }
    require(tierMax == cap);
    tiersInitialized = true;
    return tierMax;
  }
}