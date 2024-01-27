contract c40196{
	 
	 
	 
	function issueTokens (uint256 n, uint256 price, uint deadline) noEther onlyChallengeOwner {
		 
		if (now < tokenIssueDeadline) throw;
		 
		if (deadline < now) throw;
		 
		if (n == 0) throw;
		tokenPrice = price;
		tokenIssueDeadline = deadline;
		tokensToIssue = n;
		tokensIssued = 0;
		notifyTokenIssued(n, price, deadline);
	}
}