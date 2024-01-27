contract c8892{
	/**
	 * returns the index of a character of the given id
	 * @param characterId the character id
	 * @return the character id
	 * */
	function getCharacterIndex(uint32 characterId) constant public returns(uint16) {
		for (uint16 i = 0; i < ids.length; i++) {
			if (ids[i] == characterId) {
				return i;
			}
		}
		revert();
	}
}