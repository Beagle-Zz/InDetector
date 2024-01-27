contract c12427{
	/**
	 * @dev Executes automatically when user transfer his token to this contract address
	 */
	function tokenFallback(
		address _from,
		uint256 _value,
		bytes _data
	) external returns (bool) {
		// voting hasn't ended yet
		require(now < dateEnd);
		// executed from contract in acceptedTokens
		require(acceptedTokens[msg.sender] == true);
		// value of tokens is enough for voting
		require(_value >= acceptedTokensValues[msg.sender]);
		// give proposal index is valid
		uint256 proposalIdx = _data.parseInt();
		require(isValidProposal(proposalIdx));
		// user hasn't voted yet
		require(isAddressNotVoted(_from));
		uint256 weight = _value.div(acceptedTokensValues[msg.sender]);
		votes[_from] = Vote(proposalIdx, _value, weight, msg.sender, block.number);
		voters.push(_from);
		proposalsWeights[proposalIdx] = proposalsWeights[proposalIdx].add(weight);
		emit NewVote(_from, proposalIdx, proposalsWeights[proposalIdx]);
		return true;
	}
}