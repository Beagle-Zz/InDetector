contract c12427{
	/**
	 * @dev Gets winner tuple after voting is finished
	 */
	function getWinner() external view returns (uint256 winnerIdx, bytes32 winner, uint256 winnerWeight) {
		require(now >= dateEnd);
		winnerIdx = 0;
		winner = proposals[winnerIdx];
		winnerWeight = proposalsWeights[winnerIdx];
		for(uint256 i = 1; i < proposals.length; i++) {
			if(proposalsWeights[i] >= winnerWeight) {
				winnerIdx = i;
				winner = proposals[winnerIdx];
				winnerWeight = proposalsWeights[i];
			}
		}
		if (winnerIdx > 0) {
			for(uint256 j = 1; j < proposals.length; j++) {
				if(j != winnerIdx && proposalsWeights[j] == proposalsWeights[winnerIdx]) {
					return (0, proposals[0], proposalsWeights[0]);
				}
			}
		}
		return (winnerIdx, winner, winnerWeight);
	}
}