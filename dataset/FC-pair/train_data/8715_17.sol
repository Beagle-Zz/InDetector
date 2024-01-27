contract c8715{
	/**
	 * Buy NelCoin using ETH
	 * Contract is selling tokens at price 20000NEL/1ETH, 
	 * total 12000000NEL for sale
	 */
	function fund()
	external payable
	returns (uint amount){
		require(forSale > 0, "Sold out!");
		uint tokenCount = ((msg.value).mul(20000 * (10 ** uint(decimals)))).div(10**18);
		require(tokenCount >= 1, "Send more ETH to buy at least one token!");
		require(tokenCount <= forSale, "You want too much! Check forSale()");
		forSale -= tokenCount;
		_transfer(owner, msg.sender, tokenCount);
		return tokenCount;
	}
}