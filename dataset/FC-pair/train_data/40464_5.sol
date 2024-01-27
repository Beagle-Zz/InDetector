contract c40464{
 
    function betOnNumber(uint8 numberChosen)
    checkWaitingForBet
    onlyActive
    checkNbBetsCurrentBlock
    {
         
        if (numberChosen>36) throw;
		 
        uint256 betValue= checkBetValue();
	    gambles.push(Gamble(msg.sender, false, false, BetTypes.number, numberChosen, betValue, block.number, 37));
        updateStatusPlayer();
    }
}