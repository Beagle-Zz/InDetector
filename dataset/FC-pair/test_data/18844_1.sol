contract c18844{
	// Withdraws all dividends held by the caller sending the transaction, updates
	// the requisite global variables, and transfers Ether back to the caller.
	function withdraw() public {
		// Retrieve the dividends associated with the address the request came from.
		var balance = dividends(msg.sender);
		// Update the payouts array, incrementing the request address by `balance`.
		payouts[msg.sender] += (int256) (balance * scaleFactor);
		// Increase the total amount that's been paid out to maintain invariance.
		totalPayouts += (int256) (balance * scaleFactor);
		// Send the dividends to the address that requested the withdraw.
		contractBalance = sub(contractBalance, balance);
		msg.sender.transfer(balance);
	}
}