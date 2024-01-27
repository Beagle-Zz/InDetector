contract c40473{
	 
	function ChanceOfWinning(uint Value) constant returns(uint Rate, uint Bet) {
	    if (jackpot_ == 0) {
	        Rate = 0;
	        Bet = 0;
	        return;
	    }
		if (Value < minimumRollPrice) {
			Value = minimumRollPrice;
		}
		Rate = getRate(Value);
		Bet = getRealBet(Rate);
		if (Value < Bet) {
		    Rate++;
		    Bet = getRealBet(Rate);
		}
		if (Rate < BestRollRate) { 
		    Rate = BestRollRate;
		    Bet = getRealBet(Rate);
        }
	}
}