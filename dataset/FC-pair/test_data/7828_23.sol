contract c7828{
  /**
   * @dev Returns the amount in USD mill given ETH wei
   * @param _weiAmount Amount in ETH wei
   * @return amount in mill
   */
  function _toMill(uint256 _weiAmount) internal returns (uint256) {
    return _weiAmount.div(millWeiRate);
  }
}