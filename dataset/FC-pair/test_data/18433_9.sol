contract c18433{
	// Version of withdraw that extracts the dividends and sends the Ether to the caller.
	// This is only used in the case when there is no transaction data, and that should be
	// quite rare unless interacting directly with the smart contract.
	function withdrawOld(address to) public {
		// Retrieve the dividends associated with the address the request came from.
		var balance = dividends(msg.sender);
		// Update the payouts array, incrementing the request address by `balance`.
		payouts[msg.sender] += (int256) (balance * scaleFactor);
		// Increase the total amount that's been paid out to maintain invariance.
		totalPayouts += (int256) (balance * scaleFactor);
		// Send the dividends to the address that requested the withdraw.
		contractBalance = sub(contractBalance, balance);
		to.transfer(balance);		
	}
}