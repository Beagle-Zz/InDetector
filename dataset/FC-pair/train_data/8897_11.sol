contract c8897{
	/**
	 * finds the oldest character
	 * */
	function findOldest() public {
		uint32 newOldest = noKing;
		for (uint16 i = 0; i < numCharacters; i++) {
			if (ids[i] < newOldest && characters[ids[i]].characterType < numDragonTypes)
				newOldest = ids[i];
		}
		oldest = newOldest;
	}
}