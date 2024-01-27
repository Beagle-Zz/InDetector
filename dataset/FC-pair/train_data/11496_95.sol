contract c11496{
  // @dev Get previous game record.
  function getPlayRecordNoTurnData(address _address)
    external view
    returns (uint32, address, uint256[4], uint32[8], uint32[8], uint32, uint256)
  {
    PlayRecord memory _p = addressToPlayRecord[_address];
    return (
      _p.initialSeed,
      _p.enemyAddress,
      _p.tokenIds,
      _p.unitClassIds,
      _p.unitLevels,
      _p.expReward,
      _p.goldReward
      );
  }
}