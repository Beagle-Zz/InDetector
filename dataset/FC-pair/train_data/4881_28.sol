contract c4881{
	/// @notice Setup redemption destination address
	/// @param _collectorAddress address where all redemptiom fee will be directed
	/// @return result code of an operation
	function setRdCollectorAddress(address _collectorAddress) onlyContractOwner external returns (uint) {
		require(_collectorAddress != 0x0);
		rdCollectorAddress = _collectorAddress;
		return OK;
	}
}