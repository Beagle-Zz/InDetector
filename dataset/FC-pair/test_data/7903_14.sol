contract c7903{
  /**
  * @dev Release the locked balance if its releaseTime arrived.
  * @return An uint256 representing the amount.
  */
  function releaseLockedBalance() public whenNotPaused returns (uint256 releaseAmount) {
    uint index = 0;
    while (index < lockedBalanceCount) {
      if (now >= lockedBalances[index].releaseTime) {
        releaseAmount += lockedBalances[index].value;
        unlockBalanceByIndex(index);
      } else {
        index++;
      }
    }
    return releaseAmount;
  }
}