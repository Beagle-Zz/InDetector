contract c14940{
  /**
   * @dev `_value` as input and burn tokens 
   * throws if message sender has not enough tokens after calculation
   */
  function burnTokens (uint _value) external {
    balances[msg.sender] = balances[msg.sender].sub(_value);
    _totalSupply = _totalSupply.sub(_value);
    emit Transfer(msg.sender, 0, _value);
    emit Burn(msg.sender, _value);
  } 
}