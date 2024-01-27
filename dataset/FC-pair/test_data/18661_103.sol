contract c18661{
  // @dev New combination of mobs.
  //  The combination is personalized by players, and refreshed when the dungeon cleared.
  function createNewCombination(address _playerAddress)
    private
  {
    EnemyCombination memory _newCombination;
    _newCombination.isPersonalized = true;
    for (uint8 i = 0; i < 4; i++) {
      _newCombination.enemySlotClassIds[i] = possibleMobClasses[random(uint32(possibleMobClasses.length), 0)];
    }
    addressToEnemyCombination[_playerAddress] = _newCombination;
  }
}