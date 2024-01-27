contract c18719{
  /// @dev Get the current tranche or bail out if there is no tranche defined for the current timestamp.
  /// @param tokensSold total amount of tokens sold, for calculating the current tranche
  /// @return Returns the struct representing the current tranche
  function getCurrentTranche(uint tokensSold) private view returns (Tranche storage) {
    for (uint i = 0; i < tranches.length; i++) {
      if (tranches[i].start <= now && now < tranches[i].end && tokensSold < tranches[i].amount) {
        return tranches[i];
      }
    }
    // No tranche is currently active
    revert();
  }
}