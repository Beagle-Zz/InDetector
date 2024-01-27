contract c13986{
  /**
   * @dev Current rate for the specified purchaser.
   * @param _purchaser Purchaser address (may or may not be whitelisted).
   * @return Custom rate for the purchaser, or current standard rate if no custom rate was whitelisted.
   */
  function getCurrentRate(address _purchaser) public view returns (uint256 rate) {
    Period memory currentPeriod = _getCurrentPeriod();
    require(currentPeriod.rate != 0);
    rate = whitelistedRates[_purchaser];
    if (rate == 0) {
      rate = currentPeriod.rate;
    }
  }
}