contract c8900{
	/**
	 * Hits the character of the given type at the given index.
	 * @param index the index of the character
	 * @param nchars the number of characters
	 * @return the value gained from hitting the characters (zero is the character was protected)
	 * */
	function hitCharacter(uint16 index, uint16 nchars) internal returns(uint128 characterValue) {
		uint32 id = ids[index];
		if (protection[id] > 0) {
			protection[id]--;
			return 0;
		}
		characterValue = characters[ids[index]].value;
		nchars--;
		replaceCharacter(index, nchars);
	}
}