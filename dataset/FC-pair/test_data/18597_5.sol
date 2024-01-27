contract c18597{
	// Gets an owner by 0-indexed position (using numOwners as the count)
	function getOwner(uint ownerIndex) external constant returns (address) {
		return address(m_owners[ownerIndex + 1]);
	}
}