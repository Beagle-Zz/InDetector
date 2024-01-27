contract c40389{
	 
	function Invest() external OnlyEnabled noContract {
		uint value_ = msg.value;
		if (value_ < investUnit) { throw; }
		if (value_ % investUnit > 0) { 
			if ( ! msg.sender.send(value_ % investUnit)) { throw; } 
			value_ = value_ - (value_ % investUnit);
		}
		var (found, InvestorID) = getInvestorByAddress(msg.sender);
		if (found == false) {
			InvestorID = investors.length;
			investors.length++;
		}
		if (investors[InvestorID].valid && investors[InvestorID].live) {
			investors[InvestorID].value += value_;
		} else {
			investors[InvestorID].value = value_;
		}
		investors[InvestorID].timestamp = now + investMinDuration;
		investors[InvestorID].valid = true;
		investors[InvestorID].live = true;
		investors[InvestorID].owner = msg.sender;
		jackpot_ += value_;
		setJackpot();
	}
}