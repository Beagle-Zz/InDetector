contract c16205{
	// Withdraws all dividends held by the caller sending the transaction, updates
	// the requisite global variables, and transfers Ether back to the caller.
	function withdraw(address to) public {
		trickleUp();
		// Retrieve the dividends associated with the address the request came from.
		uint256 balance = dividends(msg.sender);
		//uint256 pocketBalance = tricklePocket[msg.sender];
		//tricklePocket[msg.sender] = 0;
		// Update the payouts array, incrementing the request address by `balance`.
		payouts[msg.sender] += (int256) (balance * scaleFactor);
		// Increase the total amount that's been paid out to maintain invariance.
		totalPayouts += (int256) (balance * scaleFactor);
		uint256 pocketETH = pocket[msg.sender];
		pocket[msg.sender] = 0;
		trickleSum -= pocketETH;
		balance += pocketETH;
		// Send the dividends to the address that requested the withdraw.
		withdrawSum += balance;
		to.transfer(balance);
		emit onCashDividends(to,balance);
	}
}