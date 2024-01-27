contract c18661{
  // @dev Get enemy combination.
  function getEnemyCombinationOfAddress(address _address)
    external view
    returns (uint32[4])
  {
    // Retrieve enemy information.
    // Instead of null check, isPersonalized check will tell the personalized mobs for this player exist.
    var _enemyCombination = addressToEnemyCombination[_address];
    if (_enemyCombination.isPersonalized == false) {
      // Then let's use default value.
      _enemyCombination = initialEnemyCombination;
    }
    return _enemyCombination.enemySlotClassIds;
  }
}