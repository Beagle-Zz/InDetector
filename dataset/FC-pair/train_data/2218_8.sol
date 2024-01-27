contract c2218{
  /**
   * Destroy tokens
   * 
   * Remove `_value` tokens from the system irreversibly
   * 
   * @param _value the amount of money to burn
   */
  function burn(uint256 _value) public returns (bool success) {
    require(balanceOf(msg.sender) >= _value); // Check if the sender has enough
    balances[msg.sender] = balances[msg.sender].sub(_value);
    totalSupply = totalSupply.sub(_value);
    emit Burn(msg.sender, _value);
    return true;
  }
}