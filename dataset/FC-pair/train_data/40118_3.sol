contract c40118{
	 
	function refund() noEther onlyOwner {
		if (tokenBalance == 0) throw;
		tokenBalance = 0;
		withdrawEtherOrThrow(tokenBalance * tokenPrice);
	}
}