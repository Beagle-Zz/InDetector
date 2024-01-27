contract c2859{
	/**
	 * remove artwork by random number (a string, number list)
	 * */
	function removeArtworksByString(string result,uint32 howmany) internal returns (uint128 pot) {
		uint32[] memory stolenArtworks = new uint32[](howmany);
		uint8[] memory artworkTypes = new uint8[](howmany);
		uint32[] memory sequenceNumbers = new uint32[](howmany);
		uint256[] memory artworkValues = new uint256[](howmany);
		address[] memory players = new address[](howmany);
		if (howmany>0) {
			uint32[] memory randomNumbers = getNumbersFromString(result, ",", howmany);
			uint16 index;
			uint32 artworkId;
			Artwork memory artworkData;
			pot = 0;
			if (oldest!=0)
				lastcombo++;
			for (uint32 i = 0; i < howmany; i++) {
				(artworkId,index) = findIndexFromRandomNumber(randomNumbers[i]);
				artworkData = artworks[artworkId];
				pot += artworkData.value;
				stolenArtworks[i] = artworkId;
				artworkTypes[i] = artworkData.artworkType;
				sequenceNumbers[i] = artworkData.sequenceNumber;
				artworkValues[i] = artworkData.value;
				players[i] = artworkData.player;
				replaceArtwork(index);
			}
		} else {
			pot = 0;
		}
		emit newSteal(now,stolenArtworks,artworkTypes,sequenceNumbers,artworkValues,players);
	}
}