contract c12863{
  /**
   * BasicToken transfer function
   * @dev transfer token for a specified address
   * @param _to address to transfer to.
   * @param _value amount to be transferred.
   */
  function transfer(address _to, uint256 _value) public returns (bool) {
    //Safemath functions will throw if value is invalid
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}