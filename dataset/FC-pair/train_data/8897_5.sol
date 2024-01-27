contract c8897{
	/**
	 * Replaces the character with the given id with the last character in the array
	 * @param index the index of the character in the id array
	 * @param nchars the number of characters
	 * */
	function replaceCharacter(uint16 index, uint16 nchars) internal {
		uint32 characterId = ids[index];
		numCharactersXType[characters[characterId].characterType]--;
		if (characterId == oldest) oldest = 0;
		delete characters[characterId];
		ids[index] = ids[nchars];
		delete ids[nchars];
	}
}