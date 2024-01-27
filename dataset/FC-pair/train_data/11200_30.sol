contract c11200{
	/**
	 * sets the maximum number of characters allowed in the game
	 * @param number the new maximum
	 * */
	function setMaxCharacters(uint16 number) public onlyOwner {
		maxCharacters = number;
	}
}