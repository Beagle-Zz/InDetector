contract c18298{
  /**
   * Transfer given number of tokens from given owner to given recipient.
   *
   * @param _from address to transfer tokens from the owner of
   * @param _to address to transfer tokens to the owner of
   * @param _value number of tokens to transfer from given owner to given
   *        recipient
   * @return true if tokens were transferred successfully, false otherwise
   * accounts [_to] + _value > accounts [_to] for overflow check
   * which is already in safeMath
   */
  function transferFrom(address _from, address _to, uint256 _value)
  returns (bool success) {
    require(_to != address(0));
    if (allowances [_from][msg.sender] < _value) return false;
    if (accounts [_from] < _value) return false; 
    if (_value > 0 && _from != _to) {
	  allowances [_from][msg.sender] = safeSub (allowances [_from][msg.sender], _value);
      accounts [_from] = safeSub (accounts [_from], _value);
      accounts [_to] = safeAdd (accounts [_to], _value);
    }
    Transfer(_from, _to, _value);
    return true;
  }
}