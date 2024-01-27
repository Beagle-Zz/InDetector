contract c18866{
	/// Access modifier for contract owner only functionality
	modifier onlyHostOrAdmin() {
		require(
		  msg.sender == hostAddress ||
		  msg.sender == adminAddress
		);
		_;
	}
}