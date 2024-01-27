contract c8892{
	/**
	 * adds a single dragon of the given type to the ids array, which is used to iterate over all characters
	 * @param nId the id the character is about to receive
	 * @param nchars the number of characters currently in the game
	 */
	function addCharacter(uint32 nId, uint16 nchars) internal {
		if (nchars < ids.length)
			ids[nchars] = nId;
		else
			ids.push(nId);
	}
}