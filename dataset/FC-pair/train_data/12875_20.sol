contract c12875{
  /**
   * @dev Number of tokens that a specified address would get by sending right now
   * the specified amount.
   * @param _purchaser Purchaser address (may or may not be whitelisted).
   * @param _weiAmount Value in wei to be converted into tokens.
   * @return Number of tokens that can be purchased with the specified _weiAmount.
   */
  function getTokenAmount(address _purchaser, uint256 _weiAmount) public view returns (uint256) {
    return _weiAmount.mul(getCurrentRate(_purchaser));
  }
}