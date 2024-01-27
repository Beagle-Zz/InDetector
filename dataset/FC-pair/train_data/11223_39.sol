contract c11223{
  /**
  * @dev returns a array filled with eth totals for every window
  * a convinience function to be called for updating a GUI. 
  * @return uint256[] ethTotals - the totals for commited Eth per window
  */
  function getTotals() public view returns (uint256[]) {
    uint256[] memory ethTotals = new uint256[](totalWindows);
    for (uint256 i = 0; i < totalWindows; i++) {
      ethTotals[i] = totals[i];
    }
    return ethTotals;
  }
}