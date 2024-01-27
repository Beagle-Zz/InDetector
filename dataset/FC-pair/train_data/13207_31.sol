contract c13207{
  /**
  * @dev check if pre sale is running
  */
  function isPreSaleRunning() public view returns (bool) {
    return (currentState == TokenSaleState.Pre);
  }
}