contract c8897{
	/**
	 * returns the number of knights in the game
	 * @return the number of knights
	 * */
	function getNumKnights() constant public returns(uint16 numKnights) {
		for (uint8 i = numDragonTypes; i < 2 * numDragonTypes; i++)
			numKnights += numCharactersXType[i];
	}
}