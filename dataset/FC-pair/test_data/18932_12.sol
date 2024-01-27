contract c18932{
	/**
	* distributes the given amount among the surviving characters
	* @param totalAmount nthe amount to distribute
	*/
	function distribute(uint128 totalAmount) internal {
		//pay 10% to the oldest dragon
		if (oldest == 0)
			findOldest();
		characters[oldest].value += totalAmount / 10;
		uint128 amount = totalAmount / 10 * 9;
		//distribute the rest according to their type
		uint128 valueSum;
		uint128[] memory shares = new uint128[](values.length);
		for (uint8 v = 0; v < values.length; v++) {
			if (numCharactersXType[v] > 0) valueSum += values[v];
		}
		for (uint8 m = 0; m < values.length; m++) {
			if (numCharactersXType[m] > 0)
				shares[m] = amount * values[m] / valueSum / numCharactersXType[m];
		}
		for (uint16 i = 0; i < numCharacters; i++) {
			characters[ids[i]].value += shares[characters[ids[i]].characterType];
		}
	}
}