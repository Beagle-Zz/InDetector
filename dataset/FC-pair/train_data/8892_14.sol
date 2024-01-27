contract c8892{
	/**
	* withdraw NDC and TPT tokens
	*/
	function withdraw() public onlyOwner {
		uint256 ndcBalance = neverdieToken.balanceOf(this);
		assert(neverdieToken.transfer(owner, ndcBalance));
		uint256 tptBalance = teleportToken.balanceOf(this);
		assert(teleportToken.transfer(owner, tptBalance));
	}
}