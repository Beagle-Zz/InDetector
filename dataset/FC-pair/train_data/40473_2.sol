contract c40473{
	 
	function Invest() OnlyEnabled external {
		uint value_ = msg.value;
		if (value_ < investUnit) { throw; }
		if (value_ % investUnit > 0) { 
			if ( ! msg.sender.send(value_ % investUnit)) { throw; } 
			value_ = value_ - (value_ % investUnit);
		}
		for ( uint a=0 ; a < investors.length ; a++ ) {
			if ( ! investors[a].valid) {
				newInvest(a,msg.sender,value_);
				return;
			}
		}
		investors.length++;
		newInvest(investors.length-1,msg.sender,value_);
	}
}