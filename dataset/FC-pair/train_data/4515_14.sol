contract c4515{
	/**
	 * buy artworks when likecoin transfer callback
	 * */
	function giveArtworks(uint8[] artworkTypes, address receiver, uint256 _value) internal {
		uint32 len = uint32(artworkTypes.length);
		require(numArtworks + len < maxArtworks);
		uint256 amount = 0;
		for (uint16 i = 0; i < len; i++) {
			require(artworkTypes[i] < costs.length);
			amount += costs[artworkTypes[i]];
		}
		require(_value >= amount);
		uint8 artworkType;
		uint32[] memory seqnolist = new uint32[](len);
		for (uint16 j = 0; j < len; j++) {
			if (numArtworks < ids.length)
				ids[numArtworks] = lastId;
			else
				ids.push(lastId);
			artworkType = artworkTypes[j];
			userArtworkSequenceNumber[receiver][artworkType]++;
			seqnolist[j] = userArtworkSequenceNumber[receiver][artworkType];
			artworks[lastId] = Artwork(artworkTypes[j], userArtworkSequenceNumber[receiver][artworkType], values[artworkType], receiver);
			numArtworks++;
			lastId++;
			numArtworksXType[artworkType]++;
		}
		// tryAutoTriggerSteal();
		emit newPurchase(receiver, lastId - len, artworkTypes, seqnolist);
	}
}