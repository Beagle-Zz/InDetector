contract c12427{
	/**
	 * @dev Return true if address already voted
	 */
	function isAddressVoted(address _address) private view returns (bool) {
		return ! isAddressNotVoted(_address);
	}
}