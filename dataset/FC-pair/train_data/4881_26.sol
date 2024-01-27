contract c4881{
	/// @notice Sets a price (in wei) for selling one token
	/// @param _price "in wei" = 1 ATx
	function setPrice(uint _price) onlyContractOwner external returns (uint) {
		price = _price;
		return OK;
	}
}