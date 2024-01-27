contract c16883{
  /**
   * @dev Sets the token price in US$.  Set by owner to reflect NAV/token.
   * @param _price PentacoreToken price in USD.
   */
  function setWeiPerUSD(uint256 _price) external onlyBy(navAdmin) {
    weiPerUSD = _price;
  }
}