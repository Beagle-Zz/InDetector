contract c4370{
  /// @notice Mint new tokens. Can only be called by minter or owner
  function mint(address _to, uint256 _value)
      public
      minterOrOwner
      blockLock(msg.sender)
      returns (bool success)
  {
    // ensure _value is greater than zero and
    // doesn't overflow
    if (totalSupply + _value <= totalSupply) {
      return false;
    }
    balances[_to] += _value;
    totalSupply += _value;
    Mint(_to, _value, totalSupply);
    Transfer(0x0, _to, _value);
    return true;
  }
}