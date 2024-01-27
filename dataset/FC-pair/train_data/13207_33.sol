contract c13207{
  /**
  * @dev check if sale has ended
  */
  function hasEnded() public view returns (bool) {
    return (currentState == TokenSaleState.Finished);
  }
}