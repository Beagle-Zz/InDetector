contract c4881{
	/// @notice Sets contract to active/non active state.
	/// Should be performed only by contract owner.
	/// @param _active next state of contract. True to activate a contract
	/// @return result code of an operation
	function setActive(bool _active) onlyContractOwner external returns (uint) {
		if (active == _active) {
			return;
		}
        active = _active;
		return OK;
	}
}