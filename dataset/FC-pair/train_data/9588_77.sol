contract c9588{
  // @dev Level up the hero with _tokenId.
  //  This function is called by the owner of the hero.
  function levelUp(uint256 _tokenId)
    onlyOwnerOf(_tokenId) whenNotPaused
    public
  {
    // Hero instance.
    var _heroInstance = tokenIdToHeroInstance[_tokenId];
    // The character should be avaiable. (Should have already returned from the dungeons, arenas, etc.)
    require(_heroInstance.availableAt <= now);
    // The information of the hero's class.
    var _heroClassInfo = heroClasses[_heroInstance.heroClassId];
    // Hero shouldn't level up exceed its max level.
    require(_heroInstance.currentLevel < _heroClassInfo.maxLevel);
    // Required Exp.
    var requiredExp = getHeroRequiredExpForLevelUp(_tokenId);
    // Need to have enough exp.
    require(_heroInstance.currentExp >= requiredExp);
    // Required Gold.
    var requiredGold = getHeroRequiredGoldForLevelUp(_tokenId);
    // Owner of token.
    var _ownerOfToken = ownerOf(_tokenId);
    // Need to have enough Gold balance.
    require(addressToGoldDeposit[_ownerOfToken] >= requiredGold);
    // Increase Level.
    _heroInstance.currentLevel += 1;
    // Increase Stats.
    for (uint8 i = 0; i < 5; i++) {
      _heroInstance.currentStats[i] = _heroClassInfo.baseStats[i] + (_heroInstance.currentLevel - 1) * _heroInstance.ivForStats[i];
    }
    // Deduct exp.
    _heroInstance.currentExp -= requiredExp;
    // Deduct gold.
    addressToGoldDeposit[_ownerOfToken] -= requiredGold;
    // Fire event.
    LevelUp(msg.sender, _tokenId, _heroInstance.currentLevel);
  }
}