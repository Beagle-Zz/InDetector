contract c10133{
	// **** MODIFIERS
	// @notice To limit functions usage to contract owner
	modifier onlyOwner() {
		if (msg.sender != owner) {
			error('System: onlyOwner function called by user that is not owner');
		} else {
			_;
		}
	}
}