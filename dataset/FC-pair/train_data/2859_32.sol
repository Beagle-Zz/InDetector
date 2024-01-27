contract c2859{
	/**
	 * converts a string of numbers being separated by a given delimiter into an array of numbers (#howmany) 
	 */
	function getNumbersFromString(string s, string delimiter, uint32 howmany) public pure returns(uint32[] numbers) {
		var s2 = s.toSlice();
		var delim = delimiter.toSlice();
		string[] memory parts = new string[](s2.count(delim) + 1);
		for(uint8 i = 0; i < parts.length; i++) {
			parts[i] = s2.split(delim).toString();
		}
		numbers = new uint32[](howmany);
		if (howmany>parts.length) howmany = uint32(parts.length);
		for (uint8 j = 0; j < howmany; j++) {
			numbers[j] = uint32(parseInt(parts[j]));
		}
		return numbers;
	}
}