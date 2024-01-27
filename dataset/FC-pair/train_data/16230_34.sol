contract c16230{
	/// @notice Sell all tokens for half of a price and exit this ICO
	function exitThisIcoForHalfOfTokenPrice() {
		require(icoExitIsPossible);
		require(!frozenAccount[msg.sender]);
		require(tokenBalanceOf[msg.sender] > 0);         	// checks if the sender has enough to sell
		require(currentTokenPrice > 1);
		uint256 amount = tokenBalanceOf[msg.sender] ;
		uint256 revenue = amount * currentTokenPrice / 2;
		require(this.balance >= revenue);
		_transfer(msg.sender, this, amount);
		msg.sender.transfer(revenue);                	// sends ether to the seller: it's important to do this last to prevent recursion attacks
	}
}