contract c18307{
  /**
   * @dev Allows the owner to enable the trading. This can not be undone
   */
  function startTrading() public onlyOwner {
    tradingStarted = true;
  }
}