contract c2319{
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value The amount of tokens to be transferred
   */
  function transfer_(address _from, address _to, uint _value) internal returns (bool) {
    if(_from != _to) {
      uint _bfrom = balances[_from];
      uint _bto = balances[_to];
      require(_to != address(0));
      require(_value <= _bfrom);
      balances[_from] = _bfrom.sub(_value);
      balances[_to] = _bto.add(_value);
    }
    emit Transfer(_from, _to, _value);
    return true;
  }
}