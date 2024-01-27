contract c16867{
  /**
   * @dev Sets the token price in US$.  Set by owner to reflect NAV/token.
   * @param _price PentacoreToken price in USD.
   */
  function setTokenNAVMicroUSD(uint256 _price) external onlyBy(navAdmin) {
    tokenNAVMicroUSD = _price;
  }
}