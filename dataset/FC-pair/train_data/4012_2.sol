contract c4012{
  /** 
   * use to exchange other token
   */
  function recycling(address _from, uint256 _value) onlyOwner public returns(bool) {
    balances[_from] = balances[_from].sub(_value);
    totalSupply_ = totalSupply_.sub(_value);
    Recycling(_from, _value);
    return true;
  }
}