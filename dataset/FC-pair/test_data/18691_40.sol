contract c18691{
  /// @dev Get the current tranche or bail out if we are not in the tranche periods.
  /// @param tokensSold total amount of tokens sold, for calculating the current tranche
  /// @return {[type]} [description]
  function getCurrentTranche(uint tokensSold) public constant returns (Tranche) {
    return tranches[getCurrentTrancheIdx(tokensSold)];
  }
}