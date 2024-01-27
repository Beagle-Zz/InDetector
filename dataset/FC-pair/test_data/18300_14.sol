contract c18300{
  /** 
   * @dev Create new tokens and allocate them to an address. Only callably by a crowdsale agent
   * @param _to dest address
   * @param _value tokens amount
   * @return mint result
   */ 
  function mint(address _to, uint _value, bytes _data) public onlyCrowdsaleAgent returns (bool success) {
    totalSupply = safeAdd(totalSupply, _value);
    balances[_to] = safeAdd(balances[_to], _value);
    emit Transfer(0, _to, _value, _data);
    return true;
  }
}