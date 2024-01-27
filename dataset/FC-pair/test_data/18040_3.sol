contract c18040{
	// Sells your tokens for Ether. This Ether is assigned to the callers entry
	// in the tokenBalance array, and therefore is shown as a dividend. A second
	// call to withdraw() must be made to invoke the transfer of Ether back to your address.
	function sellMyTokens() public {
		var balance = balanceOf(msg.sender);
		sell(balance);
	}
}