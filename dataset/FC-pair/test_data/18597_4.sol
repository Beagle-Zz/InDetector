contract c18597{
	// Replaces an owner `_from` with another `_to`.
	function changeOwner(address _from, address _to) onlymanyowners(sha3(msg.data)) external {
		if (isOwner(_to)) return;
		uint ownerIndex = m_ownerIndex[uint(_from)];
		if (ownerIndex == 0) return;
		clearPending();
		m_owners[ownerIndex] = uint(_to);
		m_ownerIndex[uint(_from)] = 0;
		m_ownerIndex[uint(_to)] = ownerIndex;
		OwnerChanged(_from, _to);
	}
}