contract c8892{
	/****************** GETTERS *************************/
	/**
	 * returns the character of the given id
	 * @param characterId the character id
	 * @return the type, value and owner of the character
	 * */
	function getCharacter(uint32 characterId) constant public returns(uint8, uint128, address) {
		return (characters[characterId].characterType, characters[characterId].value, characters[characterId].owner);
	}
}