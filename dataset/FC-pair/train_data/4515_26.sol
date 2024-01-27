contract c4515{
	/** distributes the given amount among the surviving artworks*/
	function distribute(uint128 totalAmount) internal {
		uint32 artworkId;
		uint128 amount = ( totalAmount * 60 ) / 100;
		uint128 valueSum = 0;
		uint128 totalAmountRemain = totalAmount;
		uint128[] memory shares = new uint128[](values.length+1);
		if (totalAmount>0) {
			//distribute the rest according to their type
			for (uint8 v = 0; v < values.length; v++) {
				if (numArtworksXType[v] > 0) valueSum += values[v];
			}
			for (uint8 m = 0; m < values.length; m++) {
				if (numArtworksXType[m] > 0)
					shares[m] = ((amount * (values[m] * 1000 / valueSum) / numArtworksXType[m]) / (1000 ether)) * (1 ether);
			}
			for (uint16 i = 0; i < numArtworks; i++) {
				artworkId = ids[i];
				amount = shares[artworks[artworkId].artworkType];
				artworks[artworkId].value += amount;
				totalAmountRemain -= amount;
			}
			setOldest();
			artworks[oldest].value += totalAmountRemain;
			shares[shares.length-1] = totalAmountRemain;			
		}
		lastStealBlockNumber = block.number;
		updateNextStealTime(timeTillNextSteal());
		emit newStealRewards(totalAmount,shares);
	}
}