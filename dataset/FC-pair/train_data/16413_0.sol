contract c16413{
   /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
    function transfer(address _to, uint256 _value) public returns (bool success) {
	    require((_value > 0) && (balances[msg.sender] >= _value));
	    balances[msg.sender] -= _value;
    	balances[_to] += _value;
    	Transfer(msg.sender, _to, _value);
    	return true;
    }
}