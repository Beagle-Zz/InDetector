contract c18661{
  // @dev Get initial enemy combination.
  function getInitialEnemyCombination()
    external view
    returns (uint32[4])
  {
    return initialEnemyCombination.enemySlotClassIds;
  }
}