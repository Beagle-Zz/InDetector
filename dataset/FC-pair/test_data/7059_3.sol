contract c7059{
  /// @dev Check if an address is a valid trader.
  function isValidTraderAddress(address addr) public view returns(bool) {
    return addresses[addr];
  }
}