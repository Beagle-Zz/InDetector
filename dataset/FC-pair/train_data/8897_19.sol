contract c8897{
	/**
	 * knights are only entering the game completely, when they are teleported to the scene
	 * @param id the character id
	 * */
	function teleportKnight(uint32 id) internal {
		// ensure we do not teleport twice
		require(teleported[id] == false);
		teleported[id] = true;
		Character storage knight = characters[id];
		require(knight.characterType >= numDragonTypes); //this also makes calls with non-existent ids fail
		addCharacter(id, numCharacters);
		numCharacters++;
		numCharactersXType[knight.characterType]++;
		NewTeleport(id);
	}
}