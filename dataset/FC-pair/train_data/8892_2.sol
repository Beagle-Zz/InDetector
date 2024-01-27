contract c8892{
	/**
	 * buys as many characters as possible with the transfered value of the given type
	 * @param characterType the type of the character
	 */
	function addCharacters(uint8 characterType) payable public {
		require(tx.origin == msg.sender);
		uint16 amount = uint16(msg.value / costs[characterType]);
		uint16 nchars = numCharacters;
		if (characterType >= costs.length || msg.value < costs[characterType] || nchars + amount > maxCharacters) revert();
		uint32 nid = nextId;
		//if type exists, enough ether was transferred and there are less than maxCharacters characters in the game
		if (characterType < numDragonTypes) {
			//dragons enter the game directly
			if (oldest == 0 || oldest == noKing)
				oldest = nid;
			for (uint8 i = 0; i < amount; i++) {
				addCharacter(nid + i, nchars + i);
				characters[nid + i] = Character(characterType, values[characterType], msg.sender, uint64(now));
			}
			numCharactersXType[characterType] += amount;
			numCharacters += amount;
		}
		else {
			// to enter game knights should be teleported later
			for (uint8 j = 0; j < amount; j++) {
				characters[nid + j] = Character(characterType, values[characterType], msg.sender, uint64(now));
			}
		}
		nextId = nid + amount;
		NewPurchase(msg.sender, characterType, amount, nid);
	}
}