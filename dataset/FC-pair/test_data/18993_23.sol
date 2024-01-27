contract c18993{
	// store the gas price as a storage variable for easy reference,
	// and then change the gas price using the proper oraclize function
	function setOraclizeQueryGasPrice(uint256 gasPrice) public {
		require(msg.sender == OWNER);
		ORACLIZEGASPRICE = gasPrice;
		oraclize_setCustomGasPrice(gasPrice);
	}
}