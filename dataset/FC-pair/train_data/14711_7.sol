contract c14711{
	/** @dev Function which calculate tokens for every month (6 months).
      * @param weiAmount Participant's contribution in wei.
      * @param currentLevelPrice Price of the tokens for the current level.
      * @param nextLevelPrice Price of the tokens for the next level.
      * @param currentLevelCap Current level cap in wei.
      * @return _currentLevelTokensAmount and _nextLevelTokensAmount Returns the calculated tokens for the current and next level
      * It is called by three hot hours
      */
	function tokensCalculator(uint weiAmount, uint currentLevelPrice, uint nextLevelPrice, uint currentLevelCap) internal view returns (uint _currentLevelTokensAmount, uint _nextLevelTokensAmount){
	    uint currentAmountInWei = 0;
		uint remainingAmountInWei = 0;
		uint currentLevelTokensAmount = 0;
		uint nextLevelTokensAmount = 0;
		// Check if the contribution overflows and you should buy tokens on next level price
		if(weiAmount.add(totalContributedWei) > currentLevelCap) {
		    remainingAmountInWei = (weiAmount.add(totalContributedWei)).sub(currentLevelCap);
		    currentAmountInWei = weiAmount.sub(remainingAmountInWei);
            currentLevelTokensAmount = currentAmountInWei.div(currentLevelPrice);
            nextLevelTokensAmount = remainingAmountInWei.div(nextLevelPrice); 
	    } else {
	        currentLevelTokensAmount = weiAmount.div(currentLevelPrice);
			nextLevelTokensAmount = 0;
	    }
	    currentLevelTokensAmount = currentLevelTokensAmount.mul(POW);
	    nextLevelTokensAmount = nextLevelTokensAmount.mul(POW);
		return (currentLevelTokensAmount, nextLevelTokensAmount);
	}
}