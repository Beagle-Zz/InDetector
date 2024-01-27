contract c2556{
  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of. 
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    if (!staff[_owner]) {
        return checkVestingWithFrozen(_owner);
    }
    return balances[_owner];
  }
}