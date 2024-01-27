contract c3148{
  /**
    @dev send coins
    throws on any error rather then return a false flag to minimize user errors
    @param _to      target address
    @param _value   transfer amount
    @return true if the transfer was successful, false if it wasn't
  */
  function transfer(address _to, uint256 _value)
      public
      onlyPayloadSize(2 * 32)
      returns (bool success)
  {
    balances[msg.sender] = safeSub(balances[msg.sender], _value);
    balances[_to] = safeAdd(balances[_to], _value);
    Transfer(msg.sender, _to, _value);
    return true;
  }
}