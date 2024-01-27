contract c16445{
	/**
	 * @dev Transfer tokens from one address to another
	 * @param _from address The address which you want to send tokens from
	 * @param _to address The address which you want to transfer to
	 * @param _value uint256 the amout of tokens to be transfered
 	 */
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
  	require(_to != address(0));
  	balances[_to] = balances[_to].add(_value);
  	balances[_from] = balances[_from].sub(_value);
  	Transfer(_from, _to, _value);
  	return true;
	}
}