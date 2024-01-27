contract c8897{
	/**
	 * returns 10 characters starting from a certain indey
	 * @param startIndex the index to start from
	 * @return 4 arrays containing the ids, types, values and owners of the characters
	 * */
	function get10Characters(uint16 startIndex) constant public returns(uint32[10] characterIds, uint8[10] types, uint128[10] values, address[10] owners) {
		uint32 endIndex = startIndex + 10 > numCharacters ? numCharacters : startIndex + 10;
		uint8 j = 0;
		uint32 id;
		for (uint16 i = startIndex; i < endIndex; i++) {
			id = ids[i];
			characterIds[j] = id;
			types[j] = characters[id].characterType;
			values[j] = characters[id].value;
			owners[j] = characters[id].owner;
			j++;
		}
	}
}