contract c18433{
	// Sell function that takes tokens and converts them into Ether. Also comes with a 10% fee
	// to discouraging dumping, and means that if someone near the top sells, the fee distributed
	// will be *significant*.
	function sell(uint256 amount) internal {
	    // Calculate the amount of Ether that the holders tokens sell for at the current sell price.
		var numEthersBeforeFee = getEtherForTokens(amount);
		// 10% of the resulting Ether is used to pay remaining holders.
        var fee = div(numEthersBeforeFee, 10);
		// Net Ether for the seller after the fee has been subtracted.
        var numEthers = numEthersBeforeFee - fee;
		// *Remove* the numTokens which were just sold from the total supply. We're /definitely/ a crypto central bank.
		totalSupply = sub(totalSupply, amount);
        // Remove the tokens from the balance of the buyer.
		tokenBalance[msg.sender] = sub(tokenBalance[msg.sender], amount);
        // Update the payout array so that the seller cannot claim future dividends unless they buy back in.
		// First we compute how much was just paid out to the seller...
		var payoutDiff = (int256) (earningsPerToken * amount + (numEthers * scaleFactor));
        // We reduce the amount paid out to the seller (this effectively resets their payouts value to zero,
		// since they're selling all of their tokens). This makes sure the seller isn't disadvantaged if
		// they decide to buy back in.
		payouts[msg.sender] -= payoutDiff;		
		// Decrease the total amount that's been paid out to maintain invariance.
        totalPayouts -= payoutDiff;
		// Check that we have tokens in existence (this is a bit of an irrelevant check since we're
		// selling tokens, but it guards against division by zero).
		if (totalSupply > 0) {
			// Scale the Ether taken as the selling fee by the scaleFactor variable.
			var etherFee = fee * scaleFactor;
			// Fee is distributed to all remaining token holders.
			// rewardPerShare is the amount gained per token thanks to this sell.
			var rewardPerShare = etherFee / totalSupply;
			// The Ether value per token is increased proportionally.
			earningsPerToken = add(earningsPerToken, rewardPerShare);
		}
	}
}