contract c13986{
  /*
   * Internal functions
   */
  /**
   * @dev Returns the current period, or null.
   */
  function _getCurrentPeriod() view internal returns (Period memory _period) {
    _period = Period(0, 0, 0);
    uint256 len = periods.length;
    for (uint256 i = 0; i < len; i++) {
      if ((periods[i].startTimestamp <= block.timestamp) && (periods[i].endTimestamp >= block.timestamp)) {
        _period = periods[i];
        break;
      }
    }
  }
}