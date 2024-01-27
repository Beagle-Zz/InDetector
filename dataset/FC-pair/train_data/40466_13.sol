contract c40466{
 
    function spinTheWheel()
    checkWaitingForSpin
    noEthSent
    {
         
         
	uint playerblock = gambles[gambleIndex[msg.sender]].blockNumber;
	if (block.number<playerblock+blockDelay || block.number>playerblock+blockExpiration) throw;
    else
	{
	    uint8 wheelResult;
         
		wheelResult = uint8(uint256(block.blockhash(playerblock+blockDelay))%37);
		updateFirstActiveGamble(gambleIndex[msg.sender]);
		gambles[gambleIndex[msg.sender]].wheelResult=wheelResult;
         
		checkBetResult(wheelResult, gambles[gambleIndex[msg.sender]].betType);
	}
    }
}