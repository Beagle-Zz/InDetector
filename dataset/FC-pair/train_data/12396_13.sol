contract c12396{
  /**
   * @dev set an exchange rate in satoshis
   * @param _rate uint256 The new exchange rate
   */
  function setBtcUsdRate(uint256 _rate) public onlyOwner {
    require(_rate > 0);
    btcUsdRate = _rate;
  }
}