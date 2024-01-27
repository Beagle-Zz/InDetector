contract c40464{
 
	 
	 
	 
    function betOnColor(bool Red, bool Black)
    checkWaitingForBet
    onlyActive
    checkNbBetsCurrentBlock
    {
        uint8 count;
        uint8 input;
        if (Red) 
        { 
             count+=1; 
             input=0;
         }
        if (Black) 
        {
             count+=1; 
             input=1;
         }
        if (count!=1) throw;
	 
        uint256 betValue= checkBetValue();
	    gambles.push(Gamble(msg.sender, false, false, BetTypes.color, input, betValue, block.number, 37));
        updateStatusPlayer();
    }
}