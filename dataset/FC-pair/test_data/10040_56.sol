contract c10040{
  /// @dev Get the current price. May revert if there is no tranche currently active.
  /// @param tokensSold total amount of tokens sold, for calculating the current tranche
  /// @return The current price
  function getCurrentPrice(uint tokensSold) public view returns (uint result) {
    return getCurrentTranche(tokensSold).price;
  }
}