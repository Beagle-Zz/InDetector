contract c10226{
  /**
  * @dev Updates the allowance by _owner of the _spender to have access to _balance.
  * @param _owner The address to query the the balance of.
  * @param _spender The address which will spend the funds
  * @param _balance An uint256 representing the amount owned by the passed address.
  */
  function setAllowance(address _owner, address _spender, uint256 _balance) internal {
    rocketStorage.setUint(keccak256("token.allowed",_owner,_spender), _balance);
  }
}