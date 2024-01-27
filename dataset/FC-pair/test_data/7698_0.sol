contract c7698{
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    require(frozenATAccount[_to]==false);
    require(frozenATAccount[msg.sender]==false);
    require(transfersEnabled==true);
    balances[_from] = sub(balances[_from],_value);
    balances[_to] = add(balances[_to],_value);
    allowed[_from][msg.sender] = sub(allowed[_from][msg.sender],_value);
    emit Transfer(_from, _to, _value);
    return true;
  }
}