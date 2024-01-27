contract c4881{
	/// @notice Withdraws all Ether from buyback contract to specified address.
	/// Allowed only for contract owner.
	/// @param _to destination address to send Ether
	/// @return result code of an operation
	function withdrawAllEth(address _to) onlyContractOwner external returns (uint) {
		uint _balance = address(this).balance;
		if (_balance == 0) {
			return 0;
		}
		_to.transfer(_balance);
		return OK;
	}
}