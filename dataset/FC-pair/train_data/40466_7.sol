contract c40466{
 
	 
	 
	 
    function betOnLowHigh(bool Low, bool High)
    checkWaitingForBet
    onlyActive
    checkNbBetsCurrentBlock
    {
        uint8 count;
        uint8 input;
        if (Low) 
        { 
             count+=1; 
             input=0;
         }
        if (High) 
        {
             count+=1; 
             input=1;
         }
        if (count!=1) throw;
	 
        uint256 betValue= checkBetValue();
	gambles.push(Gamble(msg.sender, false, false, BetTypes.lowhigh, input, betValue, block.number, 37));
        updateStatusPlayer();
    }
}