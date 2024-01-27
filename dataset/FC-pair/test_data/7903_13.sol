contract c7903{
  /**
  * @dev Gets the locked balance of the specified address.
  * @param _owner The address to query the the locked balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function lockedBalanceOf(address _owner) public constant returns (uint256 value) {
    for (uint i = 0; i < lockedBalanceCount; i++) {
      LockedBalance storage lockedBalance = lockedBalances[i];
      if (_owner == lockedBalance.owner) {
        value = value.add(lockedBalance.value);
      }
    }
    return value;
  }
}