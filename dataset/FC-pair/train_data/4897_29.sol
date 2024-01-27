contract c4897{
	/// @notice Setup redemption fee value
	/// @param _feeValue fee amount; the minimal value is 1
	/// @param _feeDecimals fee decimals, sets a precision for fee value
	/// @return result code of an operation
	function setRdFee(uint _feeValue, uint _feeDecimals) onlyContractOwner external returns (uint) {
		require(_validFee(_feeValue, _feeDecimals));
		rdFee = FeeData(_feeValue, _feeDecimals);
		return OK;
	}
}