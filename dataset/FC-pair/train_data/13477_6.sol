contract c13477{
  /**
  * @dev transfer token for a specified address internally
  * @param _from The address to transfer from.
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function _transfer(address _from, address _to, uint256 _value) internal returns (bool) {
    require(_from != address(0));
    require(_to != address(0));
    require(_value <= balances[_from]);
    // SafeMath.sub will throw if there is not enough balance.
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }
}