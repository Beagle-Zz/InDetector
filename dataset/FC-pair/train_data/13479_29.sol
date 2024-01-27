contract c13479{
  /**
   * @notice Function to finish this sale
   */
  function finishedSale() public {
    require(contractManager.authorize(contractName, msg.sender));
    require(started);
    require(!finished);
    finished = true;
    emit FinishedSale();
  }
}