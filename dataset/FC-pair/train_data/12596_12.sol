contract c12596{
  /**
   * @dev Burns a specific amount of tokens.
   * @param _value The amount of token to be burned.
   */
  function burn(address _address, uint256 _value) onlyOwner public {
      require(_value <= balances[_address]);
      // no need to require value <= totalSupply, since that would imply the
      // sender's balance is greater than the totalSupply, which *should* be an assertion failure
      address burner = _address;
      balances[burner] = balances[burner].sub(_value);
      totalSupply = totalSupply.sub(_value);
      emit Burn(burner, _value);
  }
}