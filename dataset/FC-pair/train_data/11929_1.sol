contract c11929{
	/* Calculates value of reward at given time */
	function getReward (uint currentTime) public constant returns (uint256) {
		uint elapsedTimeInSeconds = currentTime - coinBirthTime;         //calculating timealpsed after generation of coin in seconds.
		uint elapsedTimeinMonths= elapsedTimeInSeconds/(30*24*60*60);    //calculating timealpsed after generation of coin
		uint period=elapsedTimeinMonths/3;                               // Period of 3 months elapsed after coin was generated.
		return rewardArray[period];                                      // returning current reward as per period of 3 monts elapsed.
	}
}