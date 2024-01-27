contract c14591{
	/* Internal transfer, only can be called by this contract */
	function _transfer(address _from, address _to, uint256 _value) internal returns (bool _success) {
		require (_to != address(0x0));														// Prevent transfer to 0x0 address.
		require(_value >= 0);
		require (balances[_from] >= _value);                								// Check if the sender has enough
		require (balances[_to].add(_value) > balances[_to]); 								// Check for overflows
		uint256 previousBalances = balances[_from].add(balances[_to]);					// Save this for an assertion in the future
		balances[_from] = balances[_from].sub(_value);        				   				// Subtract from the sender
		balances[_to] = balances[_to].add(_value);                            				// Add the same to the recipient
		emit Transfer(_from, _to, _value);
		// Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balances[_from] + balances[_to] == previousBalances); //add safeMath
		return true;
	}
}