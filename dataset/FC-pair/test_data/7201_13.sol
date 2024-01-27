contract c7201{
  /// @dev Enable/Disable trading with smart contract (Only owner)
  function changeTradingEnabled(bool enabled) public onlyOwner {
    tradingEnabled = enabled;
  }
}