contract c11094{
   /**
   * @dev Burns a specific amount of tokens.
   * @param _value The amount of token to be burned.
   */
  function burn(uint256 _value) onlyOwner public {
    require(_value <= balances[msg.sender]);
    require(_value <= totalSupply_);
    address burner = msg.sender;
    balances[burner] = balances[burner].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);    
    emit Burn(burner, _value);
    emit Transfer(burner, address(0), _value);
  }
}