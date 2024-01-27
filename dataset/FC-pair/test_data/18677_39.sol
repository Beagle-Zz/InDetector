contract c18677{
  /// @dev Get the index of the current tranche or bail out if we are not in the tranche periods.
  /// @param tokensSold total amount of tokens sold, for calculating the current tranche
  /// @return {uint} Index of the current tranche struct in the tranches array
  function getCurrentTrancheIdx(uint tokensSold) public constant returns (uint) {
    uint i;
    for(i=0; i < tranches.length; i++) {
      if(tokensSold < tranches[i].amount) {
        return i - 1;
      }
    }
  }
}