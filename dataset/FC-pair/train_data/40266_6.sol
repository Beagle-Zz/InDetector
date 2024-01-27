contract c40266{
	 
	function addInvestorsValue(uint value) private {
		bool done;
		uint a;
		for ( a=0 ; a < investors.length ; a++ ) {
			if (investors[a].live && investors[a].valid) {
				investors[a].balance += value * investors[a].value / investmentsValue;
				done = true;
			}
		}
		if ( ! done) {
			ownerBalance += value;
		}
	}
}