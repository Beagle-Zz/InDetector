contract c7059{
  /// @dev Remove a trader address. Only owner.
  function removeTrader(uint8 protocolId) public onlyOwner {
    delete addresses[traders[protocolId]];
    delete traders[protocolId];
  }
}