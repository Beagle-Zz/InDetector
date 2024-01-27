contract c2859{
	/**
	 * sell the artwork of the given id
	 * */
	function sellArtwork(uint32 artworkId) public {
		require(msg.sender == artworks[artworkId].player);
		uint256 val = uint256(artworks[artworkId].value);// - sellfee;
		uint16 artworkIndex;
		bool found = false;
		for (uint16 i = 0; i < numArtworks; i++) {
			if (ids[i] == artworkId) {
				artworkIndex = i;
				found = true;
				break;
			}
		}
		require(found == true);
		replaceArtwork(artworkIndex);
		if (val>0)
			like.transfer(msg.sender,val);
		uint32[] memory artworkIds = new uint32[](1);
		artworkIds[0] = artworkId;
		// tryAutoTriggerSteal();
		// ids.length = numArtworks;
		emit newSell(artworkIds, msg.sender, val);
	}
}