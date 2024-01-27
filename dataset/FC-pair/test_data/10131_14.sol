contract c10131{
	// **** MODIFIERS
	// @notice To limit functions usage to contract owner
	modifier onlyICOContract() {
		if (msg.sender != addressSCICO) {
			error('RefundVault: onlyICOContract function called by user that is not ICOContract');
		} else {
			_;
		}
	}
}