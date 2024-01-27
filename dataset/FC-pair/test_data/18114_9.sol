contract c18114{
   /**
   * @dev Burns a specific amount of tokens.
   * @param _value The amount of token to be burned.
   */
function burn(uint256 _value) onlyOwner public {
    require(_value <= balanceOf[msg.sender]);
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure
    address burner = msg.sender;
    balanceOf[burner] = balanceOf[burner].sub(_value);
    totalSupply = totalSupply.sub(_value);
    emit Burn(burner, _value);
    emit Transfer(burner, address(0), _value);
  }
}