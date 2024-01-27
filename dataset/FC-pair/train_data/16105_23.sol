contract c16105{
	/// @dev Compute the amount of ODEEP token that can be purchased.
    /// @param ethAmount Amount of Ether to purchase ODEEP.
	function computeTokenAmountAll(uint256 ethAmount) internal returns (uint256) {
        uint256 tokenBase = ethAmount.mul(tokenRate);
		uint8 roundNum = currentStepIndexAll();
		uint256 tokens = tokenBase.mul(100)/(100 - (StepDiscount[roundNum]));				
		if (roundNum == 2 && (StepCaps[0] > 0 || StepCaps[1] > 0))
		{
			/// All unsold pre-sale tokens are made available at the last pre-sale period (3% discount rate)
			StepCaps[2] = StepCaps[2] + StepCaps[0] + StepCaps[1];
			StepCaps[0] = 0;
			StepCaps[1] = 0;
		}				
		uint256 balancePreIco = StepCaps[roundNum];		
		if (balancePreIco == 0 && roundNum == 2) {
		} else {
			/// If tokens available on the pre-sale run out with the order, next pre-sale discount is applied to the remaining ETH
			if (balancePreIco < tokens) {			
				uint256 toEthCaps = (balancePreIco.mul((100 - (StepDiscount[roundNum]))).div(100)).div(tokenRate);			
				uint256 toReturnEth = ethAmount - toEthCaps ;
				tokens= balancePreIco;
				StepCaps[roundNum]=StepCaps[roundNum]-balancePreIco;		
				tokens = tokens + computeTokenAmountAll(toReturnEth);			
			} else {
				StepCaps[roundNum] = StepCaps[roundNum] - tokens;
			}	
		}		
		return tokens ;
    }
}