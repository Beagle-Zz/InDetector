contract c8899{
    /// @notice Buy tokens from contract by sending ether
    function buyTokens() internal {		
		/// only accept a minimum amount of ETH?
        require(msg.value >= 0.001 ether);
        uint256 tokens ;
		uint256 xAmount = msg.value;
		uint256 toReturnEth;
		uint256 toTokensReturn;
		uint256 balanceIco ;	
		uint256 AllBonus = 0; 
		balanceIco = IcoCap;
		balanceIco = balanceIco.sub(stat.currentFundraiser);	
		AllBonus= Bonus.add(extraBonus);
		tokens = xAmount.mul(tokenRate);
		tokens = (tokens.mul(100)).div(100 - (AllBonus));
		if (balanceIco < tokens) {
			toTokensReturn = tokens.sub(balanceIco);
			toReturnEth = toTokensReturn.mul(tokenRate);
		}			
		if (tokens > 0 )
		{
			if (balanceIco < tokens) {	
				/// return  ETH
				if (toReturnEth <= xAmount) 
				{
					msg.sender.transfer(toReturnEth);									
					_EnvoisTokens(balanceIco, xAmount - toReturnEth);
				}
			} else {
				_EnvoisTokens(tokens, xAmount);
			}
		} else {
            revert();
		}
    }
}