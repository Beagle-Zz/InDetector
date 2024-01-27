contract c2018{
  /**
   * @dev Return the array of mint delegates.
   */
  function getMintDelegates() public view returns (address[]) {
    return mintDelegates;
  }
}