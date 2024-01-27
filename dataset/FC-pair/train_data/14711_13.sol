contract c14711{
	/** @dev Function which set the duration in which the tokens bought in threeHotHours will be locked
      * Called by the activateCrowdSale function 
      */
	function timeLock() internal {
		firstMonthEnd = (startTime.add(LOCK_TOKENS_DURATION)).add(threeHotHoursDuration);
		secondMonthEnd = firstMonthEnd.add(LOCK_TOKENS_DURATION);
		thirdMonthEnd = secondMonthEnd.add(LOCK_TOKENS_DURATION);
		fourthMonthEnd = thirdMonthEnd.add(LOCK_TOKENS_DURATION);
		fifthMonthEnd = fourthMonthEnd.add(LOCK_TOKENS_DURATION);
	}
}