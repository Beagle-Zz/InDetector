contract c12427{
	/**
	 * @dev Allows voter to claim his tokens back to address
	 */
	function claimTokens() public returns (bool) {
		require(isAddressVoted(msg.sender));
		require(transferTokens(msg.sender));
		emit TokensClaimed(msg.sender);
		return true;
	}
}