contract c10856{
	// ------------------------------------------------------------------------
	// Lock token supply. CAUTION: IRREVERSIBLE
	// ------------------------------------------------------------------------
	function lockSupply() public onlyOwners returns (bool isSupplyLocked) {
		require(!supplyLocked);
		if (msg.sender == owner) {
			supplyLockedA = true;
		} else if (msg.sender == parityOwner) {
			supplyLockedB = true;
		}
		supplyLocked = (supplyLockedA && supplyLockedB);
		emit SupplyLocked(true);
		return supplyLocked;
	}
}