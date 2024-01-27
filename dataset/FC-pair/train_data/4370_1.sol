contract c4370{
  /// @notice Burn tokens. Can be called by any account
  function burn(uint256 _value)
      public
      blockLock(msg.sender)
      returns (bool success)
  {
    if (_value == 0 || _value > balances[msg.sender]) {
      return false;
    }
    balances[msg.sender] -= _value;
    totalSupply -= _value;
    Burn(msg.sender, _value, totalSupply);
    Transfer(msg.sender, 0x0, _value);
    return true;
  }
}