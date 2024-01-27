contract c13207{
  /**
  * @dev check if main sale is running
  */
  function isMainSaleRunning() public view returns (bool) {
    return (currentState == TokenSaleState.Main);
  }
}