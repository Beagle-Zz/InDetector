contract c18932{
	/**
	 * pick a random dragon.
	 * @param nonce a nonce to make sure there's not always the same dragon chosen in a single block.
	 * @return the index of a random dragon
	 * */
	function getRandomDragon(uint256 nonce) internal view returns(uint16) {
		uint16 randomIndex = uint16(generateRandomNumber(nonce) % numCharacters);
		//use 7, 11 or 13 as step size. scales for up to 1000 characters
		uint16 stepSize = numCharacters % 7 == 0 ? (numCharacters % 11 == 0 ? 13 : 11) : 7;
		uint16 i = randomIndex;
		//if the picked character is a knight or belongs to the sender, look at the character + stepSizes ahead in the array (modulo the total number)
		//will at some point return to the startingPoint if no character is suited
		do {
			if (characters[ids[i]].characterType < numDragonTypes && characters[ids[i]].owner != msg.sender) return i;
			i = (i + stepSize) % numCharacters;
		} while (i != randomIndex);
		return maxCharacters + 1; //there is none
	}
}