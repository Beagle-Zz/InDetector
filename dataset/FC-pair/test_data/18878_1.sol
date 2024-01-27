contract c18878{
	/**
     * Get the token balance for account `tokenOwner`
     */
    function balanceOf(address _owner)
    	public
    	constant
    	returns (uint256 balance)
    {
        return balances[_owner];
    }
}