contract c12427{
	/**
	 * @dev Checks voting contract address for validity
	 */
	function isValidVoting(address votingAddress) private view returns (bool) {
		for (uint256 i = 0; i < votings.length; i++) {
			if (votings[i] == votingAddress) {
				return true;
			}
		}
		return false;
	}
}