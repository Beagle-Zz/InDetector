contract c18993{
	// should be ~175,000 to save eth
	function setInitialGasForOraclize(uint256 gasAmt) public {
		require(msg.sender == OWNER);
		INITIALGASFORORACLIZE = gasAmt;
	}
}