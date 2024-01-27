contract c18661{
  // @dev Set initial enemy combination.
  function setInitialEnemyCombination(uint32[4] _enemySlotClassIds)
    onlyOwner
    public
  {
    initialEnemyCombination.isPersonalized = false;
    initialEnemyCombination.enemySlotClassIds = _enemySlotClassIds;
  }
}