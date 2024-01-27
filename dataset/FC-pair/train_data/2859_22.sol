contract c2859{
	/**
	 * the frequency of the thief steal depends on the number of artworks in the game. 
	 * many artworks -> many thief steal
	 * */
	function timeTillNextSteal() constant internal returns(uint32) {
		return (86400 / (1 + numArtworks / 100)) / ( numOfTimesSteal );
	}
}