contract c7804{
  /**
   * @dev Gets the balance of the specified address.
   * @param account The address whose balance is to be queried.
   * @return An uint representing the amount owned by the passed address.
   */
  function balanceOf(address account) public view returns (uint balance) {
    return balances[account];
  }
}