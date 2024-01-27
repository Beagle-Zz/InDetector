contract c40466{
          
	function changeSettings(uint newCasinoStatLimit, uint newMaxBetsBlock, uint256 newMaxGamble, uint8 newMaxInvestor, uint256 newMinInvestment, uint256 newLockPeriod, uint8 newBlockDelay, uint8 newBlockExpiration)
	noEthSent
	onlyDeveloper
	{
	         
	        if (newCasinoStatLimit<20) throw;
	        casinoStatisticalLimit=newCasinoStatLimit;
	         
	        maxBetsPerBlock=newMaxBetsBlock;
                 
		if (newMaxGamble<=0 || newMaxGamble>=this.balance/(20*35)) throw; 
		else { maxGamble=newMaxGamble; }
                 
                if (newMaxInvestor<setting_maxInvestors || newMaxInvestor>149) throw;
                else { setting_maxInvestors=newMaxInvestor;}
                 
                setting_minInvestment=newMinInvestment;
                 
                if (setting_lockPeriod>5184000) throw;  
                setting_lockPeriod=newLockPeriod;
		         
		if (blockDelay<1) throw;
		        blockDelay=newBlockDelay;
                updateMaxBet();
		if (newBlockExpiration<100) throw;
		blockExpiration=newBlockExpiration;
	}
}