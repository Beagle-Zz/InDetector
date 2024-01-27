contract c10165{
  /**
   * @notice return if all period is finished.
   */
  function saleFinished() public view returns (bool) {
    require(stages.length == numPeriods);
    return stages[stages.length - 1].endTime < now;
  }
}