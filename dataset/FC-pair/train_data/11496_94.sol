contract c11496{
  // @dev Get previous game record.
  function getPlayRecord(address _address)
    external view
    returns (uint32, address, uint256[4], uint32[8], uint32[8], uint32, uint256, uint8, uint8[8], uint8[24], uint32[24])
  {
    PlayRecord memory _p = addressToPlayRecord[_address];
    TurnInfo memory _t = addressToTurnInfo[_address];
    return (
      _p.initialSeed,
      _p.enemyAddress,
      _p.tokenIds,
      _p.unitClassIds,
      _p.unitLevels,
      _p.expReward,
      _p.goldReward,
      _t.turnLength,
      _t.turnOrder,
      _t.defenderList,
      _t.damageList
    );
  }
}