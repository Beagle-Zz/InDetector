contract c8284{
  /**
   * @dev Getter for USD price of tokens
   */
  function getUSDPrice() private view returns (uint256) {
    return usdCentValue;
  }
}