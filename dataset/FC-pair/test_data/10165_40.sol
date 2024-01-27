contract c10165{
  /**
  * @dev Sets bonuses for time
  */
  function setBonusesForTimes(uint32[] times, uint32[] values) public onlyOwner {
    require(times.length == values.length);
    for (uint i = 0; i + 1 < times.length; i++) {
      require(times[i] < times[i+1]);
    }
    BONUS_TIMES = times;
    BONUS_TIMES_VALUES = values;
  }
}