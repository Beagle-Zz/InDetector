contract c7076{
  // @dev Summon a hero.
  // 0: Common, 1: Uncommon, 2: Rare, 3: Heroic, 4: Legendary
  function summonHero(address _to, uint8 _heroRankToMint)
    private
    returns (uint256)
  {
    // Get the list of hero classes.
    uint32 _numberOfClasses = heroContract.numberOfHeroClasses();
    uint32[] memory _candidates = new uint32[](_numberOfClasses);
    uint32 _count = 0;
    for (uint32 i = 0; i < _numberOfClasses; i ++) {
      if (heroContract.getClassRank(i) == _heroRankToMint && blackList[i] != true) {
        _candidates[_count] = i;
        _count++;
      }
    }
    require(_count != 0);
    return heroContract.mint(_to, _candidates[random(_count, 0)]);
  }
}