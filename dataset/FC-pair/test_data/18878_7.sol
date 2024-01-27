contract c18878{
	/**
	 * Mint new tokens
	 *
	 * @param _value the amount of new tokens
	 */
    function mint(uint256 _value)
        public
        onlyOwner
    {
    	// Prevent mine 0 tokens
        require(_value > 0);
    	// Check overflow
    	balances[owner] = balances[owner].add(_value);
        totalSupply = totalSupply.add(_value);
        Transfer(address(0), owner, _value);
    }
}