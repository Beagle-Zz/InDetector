contract c18878{
	/**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint256 _value)
    	internal
    	returns (bool success)
    {
		// Do not allow transfer to 0x0 or the token contract itself or from address to itself
		require((_to != address(0)) && (_to != address(this)) && (_to != _from));
        // Check if the sender has enough
        require((_value > 0) && (balances[_from] >= _value));
        // Check for overflows
        require(balances[_to] + _value > balances[_to]);
        // Subtract from the sender
        balances[_from] -= _value;
        // Add the same to the recipient
        balances[_to] += _value;
        Transfer(_from, _to, _value);
        return true;
    }
}