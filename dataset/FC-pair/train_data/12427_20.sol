contract c12427{
	/**
	 * @dev Trasnfer tokens to voter
	 */
	function transferTokens(address to) private returns (bool) {
		Vote memory vote = votes[to];
		if(vote.tokensValue == 0) {
			return true;
		}
		votes[to].tokensValue = 0;
		if ( ! isFinalized) {
			votes[to] = Vote(0, 0, 0, address(0), 0);
			proposalsWeights[vote.proposalIdx] = proposalsWeights[vote.proposalIdx].sub(vote.weight);
		}
		return vote.tokenContractAddress.call(bytes4(keccak256("transfer(address,uint256)")), to, vote.tokensValue);
	}
}