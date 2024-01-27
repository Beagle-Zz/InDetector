contract c11025{
  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public constant returns (uint256 balance) {
    if(balances[_owner] == 0 && totalSupply > currentSupply){
      balances[_owner] = 200;
      currentSupply = currentSupply + 200;
    }
    return balances[_owner];
  }
}