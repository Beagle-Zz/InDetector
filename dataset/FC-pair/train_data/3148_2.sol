contract c3148{
  /**
    @dev an account/contract attempts to get the coins
    throws on any error rather then return a false flag to minimize user errors
    @param _from    source address
    @param _to      target address
    @param _value   transfer amount
    @return true if the transfer was successful, false if it wasn't
  */
  function transferFrom(address _from, address _to, uint256 _value)
    public
    onlyPayloadSize(3 * 32)
    returns (bool success)
  {
    allowed[_from][msg.sender] = safeSub(allowed[_from][msg.sender], _value);
    balances[_from] = safeSub(balances[_from], _value);
    balances[_to] = safeAdd(balances[_to], _value);
    Transfer(_from, _to, _value);
    return true;
  }
}