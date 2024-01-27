contract c7066{
  /**
   * Burn tokens.
   *
   * @param _value number of tokens to burn
   */
  function burnTokens (uint256 _value)
  public delegatable payable returns (bool) {
    require (msg.sender == owner);
    if (_value > 0) {
      if (_value <= accounts [msg.sender]) {
        accounts [msg.sender] = safeSub (accounts [msg.sender], _value);
        tokensCount = safeSub (tokensCount, _value);
        Transfer (msg.sender, address (0), _value);
        return true;
      } else return false;
    } else return true;
  }
}