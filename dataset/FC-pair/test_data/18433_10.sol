contract c18433{
	// Internal balance function, used to calculate the dynamic reserve value.
	function balance() internal constant returns (uint256 amount) {
		// msg.value is the amount of Ether sent by the transaction.
		return contractBalance - msg.value;
	}
}