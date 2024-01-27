contract c18932{
	/**
	 * sell the character of the given id
	 * throws an exception in case of a knight not yet teleported to the game
	 * @param characterId the id of the character
	 * */
	function sellCharacter(uint32 characterId) public {
		require(msg.sender == characters[characterId].owner);
		uint128 val = characters[characterId].value;
		numCharacters--;
		replaceCharacter(getCharacterIndex(characterId), numCharacters);
		msg.sender.transfer(val);
		NewSell(characterId, msg.sender, val);
	}
}