contract c18128{
  /// @dev Ends the funding period and sends the ETH home
  function finalize() external onlyOwner {
    require (!isFinalized);
    // move to operational
    isFinalized = true;
    ethFundDeposit.transfer(this.balance);
  }
}