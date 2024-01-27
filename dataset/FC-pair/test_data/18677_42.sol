contract c18677{
  /// @dev Get the current price.
  /// @param tokensSold total amount of tokens sold, for calculating the current tranche
  /// @return The current price or 0 if we are outside trache ranges
  function getCurrentPrice(uint tokensSold) public constant returns (uint result) {
    return getCurrentTranche(tokensSold).price;
  }
}