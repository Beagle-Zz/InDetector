contract c8892{
	/**
	 * returns the number of dragons in the game
	 * @return the number of dragons
	 * */
	function getNumDragons() constant public returns(uint16 numDragons) {
		for (uint8 i = 0; i < numDragonTypes; i++)
			numDragons += numCharactersXType[i];
	}
}