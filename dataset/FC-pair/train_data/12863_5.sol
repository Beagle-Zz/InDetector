contract c12863{
  /**
   * BasicToken balanceOf function 
   * @dev Gets the balance of the specified address.
   * @param _owner address to get balance of.
   * @return uint256 amount owned by the address.
   */
  function balanceOf(address _owner) public constant returns (uint256 bal) {
    return balances[_owner];
  }
}