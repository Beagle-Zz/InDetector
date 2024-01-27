contract c2107{
  /*
   * @notice a specific amount of tokens. Only controller can burn tokens
   * @param _value The amount of token to be burned.
   */
  function burn(uint _value) public onlyController{
    require(_value <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    totalSupply = totalSupply.sub(_value);
    emit Burn(msg.sender, _value);
    emit Transfer(msg.sender, address(0), _value);
  }
}