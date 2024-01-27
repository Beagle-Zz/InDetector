contract c13617{
  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  /*@CTK balanceOf
    @post __reverted == false
    @post __return == balances[_owner]
   */
  /* CertiK Smart Labelling, for more details visit: https://certik.org */
  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }
}