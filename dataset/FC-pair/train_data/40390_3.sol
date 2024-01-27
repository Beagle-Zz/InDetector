contract c40390{
	 
	function InvestAdd() external OnlyEnabled noContract {
		uint value_ = msg.value;
		if (value_ < investUnit) { throw; }
		if (value_ % investUnit > 0) { 
			if ( ! msg.sender.send( value_ % investUnit )) { throw; } 
			value_ = value_ - (value_ % investUnit);
		}
		if (value_ < investMinimum) { throw; }
		var (found, InvestorID) = getInvestorByAddress(msg.sender);
		if (found == false) {
			if (investors.length == investUserLimit) { throw; }
			InvestorID = investors.length;
			investors.length++;
		}
		if (investors[InvestorID].valid && investors[InvestorID].live) {
			investors[InvestorID].value += value_;
		} else {
			investors[InvestorID].value = value_;
		}
		investors[InvestorID].begins = currentGame;
		investors[InvestorID].valid = true;
		investors[InvestorID].live = true;
		investors[InvestorID].owner = msg.sender;
		investmentsValue += value_;
		setJackpot();
		InvestAddEvent(msg.sender, value_);
	}
}