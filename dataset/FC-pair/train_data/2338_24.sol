contract c2338{
  /**
   * @dev function for Daonomic UI
   */
  function getRate(address _token) view public returns (uint256) {
    if (_token == address(0)) {
      uint8 stage = getStage(sold);
      if (stage == stages.length) {
        return 0;
      }
      return rates[stage] * 10 ** 18;
    } else {
      return 0;
    }
  }
}