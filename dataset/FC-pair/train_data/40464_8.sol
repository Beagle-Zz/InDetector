contract c40464{
 
	 
      
     
    function betOnOddEven(bool Odd, bool Even)
    checkWaitingForBet
    onlyActive
    checkNbBetsCurrentBlock
    {
        uint8 count;
        uint8 input;
        if (Even) 
        { 
             count+=1; 
             input=0;
         }
        if (Odd) 
        {
             count+=1; 
             input=1;
         }
        if (count!=1) throw;
	 
        uint256 betValue= checkBetValue();
	gambles.push(Gamble(msg.sender, false, false, BetTypes.parity, input, betValue, block.number, 37));
        updateStatusPlayer();
    }
}