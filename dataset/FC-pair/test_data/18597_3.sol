contract c18597{
	// Revokes a prior confirmation of the given operation
	function revoke(bytes32 _operation) external {
		uint ownerIndex = m_ownerIndex[uint(msg.sender)];
		// make sure they're an owner
		if (ownerIndex == 0) return;
		uint ownerIndexBit = 2**ownerIndex;
		var pending = m_pending[_operation];
		if (pending.ownersDone & ownerIndexBit > 0) {
			pending.yetNeeded++;
			pending.ownersDone -= ownerIndexBit;
			Revoke(msg.sender, _operation);
		}
	}
}