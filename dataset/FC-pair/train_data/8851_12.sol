contract c8851{
  /**
   * @dev Burns a specific amount of tokens.
   * @param _to address The address which is burned.
   * @param _amount The amount of token to be burned.
   */
  function burn(address _to, uint256 _amount) public onlyOwner {
    require(_amount <= balances[_to]);
    require(block.timestamp > lockups[_to]);
    // no need to require value <= totalSupply, since that would imply the
    // sender's balance is greater than the totalSupply, which *should* be an assertion failure
    balances[_to] = balances[_to].sub(_amount);
    totalSupply_ = totalSupply_.sub(_amount);
    emit Burn(_to, _amount);
    emit Transfer(_to, address(0), _amount);
  }
}