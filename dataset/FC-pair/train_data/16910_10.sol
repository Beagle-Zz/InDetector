contract c16910{
  /*
  * @dev Allows us to view the token balance of the account.
  * @param _owner address Address of the user whose token we are allowed to spend from sender address.
  * @param _spender address Address of the user allowed to spend owner's tokens.
  */
  function allowance(address _owner, address _spender) constant public returns(uint256 remaining) {
    return allowances[_owner][_spender];
  }
}