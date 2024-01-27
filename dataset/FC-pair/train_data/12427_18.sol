contract c12427{
	/**
	 * @dev Return true if address not voted yet
	 */
	function isAddressNotVoted(address _address) private view returns (bool) {
		// solium-disable-next-line operator-whitespace
		return (
			// solium-disable-next-line operator-whitespace
			votes[_address].proposalIdx == 0 &&
			votes[_address].tokensValue == 0 &&
			votes[_address].weight == 0 &&
			votes[_address].tokenContractAddress == address(0) &&
			votes[_address].blockNumber == 0
		);
	}
}