contract c12427{
	/**
	 * @dev Checks proposal index for validity
	 */
	function isValidProposal(uint256 proposalIdx) private view returns (bool) {
		return (
			proposalIdx > 0 &&
			proposals[proposalIdx].length > 0
		);
	}
}