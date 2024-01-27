contract c8284{
  /**
   * @dev Change USD price of tokens
   * @param _ethPrice New Ether price
   */
  function updatePrice(uint256 _ethPrice) private {
    uint256 centBase = 1 * 10 ** 16;
    require(_ethPrice > 0);
    ethPrice = _ethPrice;
    usdCentValue = centBase.div(_ethPrice);
  }
}