contract c12427{
	/**
	 * @dev Creates new instance of UKTTokenVoting contract with given params
	 */
	function getNewVoting(
		uint256 dateEnd,
		bytes32[] proposals,
		address[] acceptedTokens,
		uint256[] acceptedTokensValues
	) public onlyOwner returns (address votingAddress) {
		votingAddress = address(new UKTTokenVoting(dateEnd, proposals, acceptedTokens, acceptedTokensValues));
		emit VotingCreated(votingAddress, dateEnd, proposals, acceptedTokens, acceptedTokensValues);
		votings.push(votingAddress);
		votingsWinners[votingAddress] = -1;
		return votingAddress;
	}
}