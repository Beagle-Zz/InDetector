contract c11200{
	/**
	 * @return the accumulated fees
	 * */
	function getFees() constant public returns(uint) {
		uint reserved = 0;
		for (uint16 j = 0; j < numCharacters; j++)
			reserved += characters[ids[j]].value;
		return address(this).balance - reserved;
	}
}