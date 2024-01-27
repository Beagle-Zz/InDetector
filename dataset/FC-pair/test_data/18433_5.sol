contract c18433{
	// Gatekeeper function to check if the amount of Ether being sent isn't either
	// too small or too large. If it passes, goes direct to buy().
	function fund() payable public {
		// Don't allow for funding if the amount of Ether sent is less than 1 szabo.
		if (msg.value > 0.000001 ether) {
		    contractBalance = add(contractBalance, msg.value);
			buy();
		} else {
			revert();
		}
    }
}