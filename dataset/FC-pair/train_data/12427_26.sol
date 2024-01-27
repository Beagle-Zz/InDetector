contract c12427{
	/**
	 * @dev Gets voting winner
	 */
	function getVotingWinner(address votingAddress) public view returns (bytes32) {
		require(votingsWinners[votingAddress] > -1);
		return UKTTokenVoting(votingAddress).proposals(uint256(votingsWinners[votingAddress]));
	}
}