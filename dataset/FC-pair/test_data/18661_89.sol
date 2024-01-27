contract c18661{
  // @dev Get previous game record.
  function getPlayRecord(address _address)
    external view
    returns (uint32 initialSeed, uint32 progress, uint256[4] heroTokenIds, uint32[8] uintClassIds, uint32[8] unitLevels, uint32 expRewardGiven, uint256 goldRewardGiven, uint8 turnLength, uint8[8] turnOrder, uint8[24] defenderList, uint32[24] damageList)
  {
    PlayRecord memory _p = addressToPlayRecord[_address];
    TurnInfo memory _t = addressToTurnInfo[_address];
    return (_p.initialSeed, _p.progress, _p.tokenIds, _p.unitClassIds, _p.unitLevels, _p.expReward, _p.goldReward, _t.turnLength, _t.turnOrder, _t.defenderList, _t.damageList);
  }
}