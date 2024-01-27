contract c2325{
  /**
   * Check if token is locked.
   */
  function tokenIsLocked(address _contributor) public constant returns (bool) {
    if (block.timestamp < lockInTime1 && contributorList[_contributor].lockupPeriod == 1) {
      return true;
    } else if (block.timestamp < lockInTime2 && contributorList[_contributor].lockupPeriod == 2) {
      return true;
    }
    return false;
  }
}