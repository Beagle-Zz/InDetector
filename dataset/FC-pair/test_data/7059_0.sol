contract c7059{
  /// @dev Add a valid trader address. Only owner.
  function addTrader(uint8 protocolId, ITrader trader) public onlyOwner {
    require(protocolId == trader.getProtocol());
    traders[protocolId] = trader;
    addresses[trader] = true;
  }
}