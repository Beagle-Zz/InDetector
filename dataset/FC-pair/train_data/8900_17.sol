contract c8900{
	/**
	 * sell the character of the given id
	 * throws an exception in case of a knight not yet teleported to the game
	 * @param characterId the id of the character
	 * */
	function sellCharacter(uint32 characterId) public {
		require(tx.origin == msg.sender);
		require(msg.sender == characters[characterId].owner);
		require(characters[characterId].characterType < 2*numDragonTypes);
		require(characters[characterId].purchaseTimestamp + 1 days < now);
		uint128 val = characters[characterId].value;
		numCharacters--;
		replaceCharacter(getCharacterIndex(characterId), numCharacters);
		msg.sender.transfer(val);
		if (oldest == 0)
			findOldest();
		NewSell(characterId, msg.sender, val);
	}
}