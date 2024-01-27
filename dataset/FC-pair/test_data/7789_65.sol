contract c7789{
  /**
   * @dev Check if currently active period is a given time period.
   * @param _startTime Starting timestamp (inclusive).
   * @param _endTime Ending timestamp (exclusive).
   * @return bool
   */
  function isInTimeRange(
    uint256 _startTime,
    uint256 _endTime
  )
    internal
    view
    returns(bool)
  {
    if (now >= _startTime && now < _endTime) {
      return true;
    }
    else {
      return false;
    }
  }
}