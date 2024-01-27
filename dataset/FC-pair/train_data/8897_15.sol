contract c8897{
	/**
	 * pays out the players.
	 * */
	function payOut() public onlyOwner {
		for (uint16 i = 0; i < numCharacters; i++) {
			characters[ids[i]].owner.transfer(characters[ids[i]].value);
			delete characters[ids[i]];
		}
		delete ids;
		numCharacters = 0;
	}
}