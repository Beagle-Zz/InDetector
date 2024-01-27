contract c18661{
  // @dev Get previous game record.
  function getPlayRecordNoTurnData(address _address)
    external view
    returns (uint32 initialSeed, uint32 progress, uint256[4] heroTokenIds, uint32[8] uintClassIds, uint32[8] unitLevels, uint32 expRewardGiven, uint256 goldRewardGiven)
  {
    PlayRecord memory _p = addressToPlayRecord[_address];
    return (_p.initialSeed, _p.progress, _p.tokenIds, _p.unitClassIds, _p.unitLevels, _p.expReward, _p.goldReward);
  }
}