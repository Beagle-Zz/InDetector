contract c11223{
  /**
  * @dev returns a array filled with commitments of address for every window
  * a convinience function to be called for updating a GUI. 
  * @return uint256[] commitments - the commited Eth per window of a given address
  */
  function getCommitmentsOf(address from) public view returns (uint256[]) {
    uint256[] memory commitments = new uint256[](totalWindows);
    for (uint256 i = 0; i < totalWindows; i++) {
      commitments[i] = commitment[from][i];
    }
    return commitments;
  }
}