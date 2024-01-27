contract c7066{
  /**
   * Transfer given number of tokens from given owner to given recipient.
   *
   * @param _from address to transfer tokens from the owner of
   * @param _to address to transfer tokens to the owner of
   * @param _value number of tokens to transfer from given owner to given
   *        recipient
   * @return true if tokens were transferred successfully, false otherwise
   */
  function transferFrom (address _from, address _to, uint256 _value)
  public payable returns (bool success) {
    uint256 spenderAllowance = allowances [_from][msg.sender];
    if (spenderAllowance < _value) return false;
    uint256 fromBalance = accounts [_from];
    if (fromBalance < _value) return false;
    allowances [_from][msg.sender] =
      safeSub (spenderAllowance, _value);
    if (_value > 0 && _from != _to) {
      accounts [_from] = safeSub (fromBalance, _value);
      accounts [_to] = safeAdd (accounts [_to], _value);
    }
    Transfer (_from, _to, _value);
    return true;
  }
}