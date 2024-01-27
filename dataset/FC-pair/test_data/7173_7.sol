contract c7173{
  /**
  * @dev recycle token for a specified address
  * @param _user user address.
  * @param _value The amount to be burnned.
  */
  function recycle(address _user,uint256 _value) returns (bool success) {
	require(msg.sender == owner);
    require(balances[_user] >= _value);
	require(_value > 0);
	balances[msg.sender] = SafeMath.add(balances[msg.sender],(_value));
	balances[_user] = SafeMath.sub(balances[_user],(_value));           
    //Burn(msg.sender, _value);
    return true;
    }
}