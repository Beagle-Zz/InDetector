contract c7789{
  /**
   * @dev Burns a specific amount of tokens. This function is based on BurnableToken implementation
   * at goo.gl/GZEhaq.
   * @notice Only owner is allowed to perform this operation.
   * @param _value The amount of tokens to be burned.
   */
  function burn(
    uint256 _value
  )
    onlyOwner()
    external
  {
    require(_value <= balances[msg.sender]);
    balances[owner] = balances[owner].sub(_value);
    tokenTotalSupply = tokenTotalSupply.sub(_value);
    emit Burn(owner, _value);
    emit Transfer(owner, address(0x0), _value);
  }
}