contract c8897{
	/**
	* distributes the given amount among the surviving characters
	* @param totalAmount nthe amount to distribute
	*/
	function distribute(uint128 totalAmount) internal {
		uint128 amount;
		if (oldest == 0)
			findOldest();
		if (oldest != noKing) {
			//pay 10% to the oldest dragon
			characters[oldest].value += totalAmount / 10;
			amount	= totalAmount / 10 * 9;
		} else {
			amount	= totalAmount;
		}
		//distribute the rest according to their type
		uint128 valueSum;
		uint8 size = 2 * numDragonTypes;
		uint128[] memory shares = new uint128[](size);
		for (uint8 v = 0; v < size; v++) {
			if (numCharactersXType[v] > 0) valueSum += values[v];
		}
		for (uint8 m = 0; m < size; m++) {
			if (numCharactersXType[m] > 0)
				shares[m] = amount * values[m] / valueSum / numCharactersXType[m];
		}
		uint8 cType;
		for (uint16 i = 0; i < numCharacters; i++) {
			cType = characters[ids[i]].characterType;
			if(cType < size)
				characters[ids[i]].value += shares[characters[ids[i]].characterType];
		}
	}
}