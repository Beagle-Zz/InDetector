contract c12911{
  /**
   *  Burn away the specified amount of SkinCoin tokens
   */
  function burn(uint _value) onlyOwner public returns (bool) {
    balances[msg.sender] = balances[msg.sender].sub(_value);
    totalSupply = totalSupply.sub(_value);
    Transfer(msg.sender, 0x0, _value);
    return true;
  }
}