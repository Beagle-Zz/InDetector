contract c12427{
	/**
	 * @dev Refunds tokens for all voters
	 */
	function refundVotingTokens(address votingAddress, address to) public onlyOwner returns (bool) {
		require(isValidVoting(votingAddress));
		return UKTTokenVoting(votingAddress).refundTokens(to);
	}
}