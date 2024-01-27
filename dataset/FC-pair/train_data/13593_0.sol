contract c13593{
  /**
   * @dev Retrieves the balance of a specified address
   * @param _owner address The address to query the balance of.
   * @return A uint256 representing the amount owned by the _owner
   */
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }
}