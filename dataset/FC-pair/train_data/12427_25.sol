contract c12427{
	/**
	 * @dev Sets calculated proposalIdx as voting winner
	 */
	function setVotingWinner(address votingAddress) public onlyOwner {
		require(votingsWinners[votingAddress] == -1);
		uint256 winnerIdx;
		bytes32 winner;
		uint256 winnerWeight;
		(winnerIdx, winner, winnerWeight) = UKTTokenVoting(votingAddress).getWinner();
		bool isFinalizedValidly = winnerIdx > 0;
		UKTTokenVoting(votingAddress).finalize(isFinalizedValidly);
		emit VotingFinalized(votingAddress, isFinalizedValidly);
		votingsWinners[votingAddress] = int256(winnerIdx);
		emit WinnerSetted(votingAddress, winnerIdx, winner, winnerWeight);
	}
}