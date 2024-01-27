contract c7059{
  /// @dev Get trader by protocolId.
  function getTrader(uint8 protocolId) public view returns(ITrader) {
    return traders[protocolId];
  }
}