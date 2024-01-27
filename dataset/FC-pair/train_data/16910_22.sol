contract c16910{
  /************ AirDrop part of the SC. ************/
  /*
  * @dev Allocates the specified amount of tokens to the address.
  * @param _beneficiary address Address of the ouser that receives the tokens.
  * @param _tokens uint256 Amount of tokens to allocate.
  */
  function airDrop(address _beneficiary, uint256 _tokens) onlyOwner public returns(bool success){
    require(!airDropFinished);
    balances[owner] -= _tokens;
    balances[_beneficiary] += _tokens;
    return true;
  }
}