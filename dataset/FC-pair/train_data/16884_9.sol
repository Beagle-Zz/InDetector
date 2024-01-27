contract c16884{
  //find out bonus for specific timestamp
  function BonusPeriodFor(uint256 timestamp) public view returns (bool ongoing, uint256 from, uint256 to, uint256 num, uint256 den) {
    for(uint i = 0; i < bonusPeriods.length; i++)
      if (bonusPeriods[i].fromTimestamp <= timestamp && bonusPeriods[i].toTimestamp >= timestamp)
        return (true, bonusPeriods[i].fromTimestamp, bonusPeriods[i].toTimestamp, bonusPeriods[i].bonusNumerator,
          bonusPeriods[i].bonusDenominator);
    return (false, 0, 0, 0, 0);
  }
}