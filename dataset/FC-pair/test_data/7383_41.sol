contract c7383{
  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier whenNotExceedLock(address _granted, uint256 _value) {
    uint256 lockedAmount = lockedAmountOf(_granted);
    uint256 balance = balanceOf(_granted);
    require(balance > lockedAmount && balance.sub(lockedAmount) >= _value);
    _;
  }
}