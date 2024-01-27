contract c4038{
  // @dev Mint a new hero, with _heroClassId.
  function mint(address _owner, uint32 _heroClassId)
    onlyAccessMint
    public
    returns (uint256)
  {
    require(_owner != address(0));
    require(_heroClassId < numberOfHeroClasses);
    // The information of the hero's class.
    var _heroClassInfo = heroClasses[_heroClassId];
    // Mint ERC721 token.
    _mint(_owner, numberOfTokenIds);
    // Build random IVs for this hero instance.
    uint32[5] memory _ivForStats;
    uint32[5] memory _initialStats;
    for (uint8 i = 0; i < 5; i++) {
      _ivForStats[i] = (random(_heroClassInfo.maxIVForStats[i] + 1, _heroClassInfo.minIVForStats[i]));
      _initialStats[i] = _heroClassInfo.baseStats[i] + _ivForStats[i];
    }
    // Temporary hero instance.
    HeroInstance memory _heroInstance = HeroInstance({
      heroClassId: _heroClassId,
      heroName: "",
      currentLevel: 1,
      currentExp: 0,
      lastLocationId: 0,
      availableAt: now,
      currentStats: _initialStats,
      ivForStats: _ivForStats
    });
    // Save the hero instance.
    tokenIdToHeroInstance[numberOfTokenIds] = _heroInstance;
    // Increment number of token ids.
    // This will only increment when new token is minted, and will never be decemented when the token is burned.
    numberOfTokenIds ++;
     // Increment instanced number of heroes.
    _heroClassInfo.currentNumberOfInstancedHeroes ++;
    return numberOfTokenIds - 1;
  }
}