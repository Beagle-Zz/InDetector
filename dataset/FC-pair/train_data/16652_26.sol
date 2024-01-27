contract c16652{
    /// @notice Buy tokens from contract by sending ether
    function buyTokens() internal {		
		/// only accept a minimum amount of ETH?
        require(msg.value >= 0.001 ether);
        uint256 tokens ;
		uint256 xAmount = msg.value;
		uint256 toReturnEth;
		uint256 toTokensReturn;
		uint256 balanceIco ;
		if(isPreSale()){	
			balanceIco = preIcoCap.sub(stat.currentFundraiser);
			tokens =computeTokenAmountAll(xAmount);
			if (balanceIco < tokens) {	
				uint8 roundNum = currentStepIndexAll();
				toTokensReturn = tokens.sub(balanceIco);	 
				toReturnEth = (toTokensReturn.mul((100 - (StepDiscount[roundNum]))).div(100)).div(tokenRate);			
			}			
		} else if (isMainSale()) {
			balanceIco = IcoCap.add(preIcoCap);
 			balanceIco = balanceIco.sub(stat.currentFundraiser);	
			tokens = xAmount.mul(tokenRate);
			if (balanceIco < tokens) {
				toTokensReturn = tokens.sub(balanceIco);
				toReturnEth = toTokensReturn.mul(tokenRate);
			}			
		} else {
            revert();
        }
		if (tokens > 0 )
		{
			if (balanceIco < tokens) {	
				/// return  ETH
				msg.sender.transfer(toReturnEth);
				_EnvoisTokens(balanceIco, xAmount - toReturnEth);
			} else {
				_EnvoisTokens(tokens, xAmount);
			}
		} else {
            revert();
		}
    }
}