contract c13074{
	/**
     * Give back token to contract bypassing selling from owner account
     * 
     * @param amount amount of token in wei
     */
		function restore(uint256 amount) public onlyOwner {
        uint256 newPrice = _newPrice(balanceOf[this] + amount);                 // calc new price after transfer
        _transfer(owner, this, amount );                                        // transfer token back to contract
        _setPrices( newPrice );                                                 // update prices after transfer
    }
}