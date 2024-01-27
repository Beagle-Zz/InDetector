contract c8168{
  /**
  * @dev Burn tokens
  * @param _value Amount of tokens to burn
  */
  function burn(uint256 _value) external {
    require(balances[msg.sender] >= _value);
    totalSupply = totalSupply.sub(_value);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    emit Transfer(msg.sender, address(0), _value);
    emit Burn(msg.sender, _value);
  }
}