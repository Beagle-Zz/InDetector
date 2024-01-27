contract c18677{
  /// @dev Get the total volume to be sold in the current tranche or bail out if we are not in the tranche periods.
  /// @param tokensSold total amount of tokens sold, for calculating the current tranche
  /// @return {uint} Number of tokens to be sold in the current tranche
  function getCurrentTrancheVolume(uint tokensSold) public constant returns (uint) {
    uint idx = getCurrentTrancheIdx(tokensSold);
    uint currAmount = tranches[idx].amount;
    uint nextAmount = tranches[idx + 1].amount;
    return nextAmount - currAmount;
  }
}