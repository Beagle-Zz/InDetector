contract c7173{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(msg.sender == owner);
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    balances[msg.sender] = SafeMath.sub(balances[msg.sender],(_value));
    balances[_to] = SafeMath.add(balances[_to],(_value));
    return true;
  }
}