contract c70{
  // Implements the logic to create the storage buffer for a Crowdsale Purchase
  function buy() internal view {
    bool sale_is_whitelisted = Contract.read(Sale.isWhitelisted()) != 0 ? true : false;
    bool sender_has_contributed = Contract.read(Sale.hasContributed(Contract.sender())) != 0 ? true : false;
    // Calculate current sale rate from start time, start and end rates, and duration
  	uint current_rate = getCurrentRate(
  	  uint(Contract.read(Sale.startTime())),
  	  uint(Contract.read(Sale.startRate())),
  	  uint(Contract.read(Sale.endRate())),
  	  uint(Contract.read(Sale.totalDuration()))
  	);
  	// If sender has already purchased tokens then change minimum contribution amount to 0;
  	uint min_contribution;
    // If the sale is whitelisted -
    if (sale_is_whitelisted && !sender_has_contributed)
      min_contribution = uint(Contract.read(Sale.whitelistMinTok(Contract.sender())));
    else if (!sale_is_whitelisted && !sender_has_contributed)
      min_contribution = uint(Contract.read(Sale.globalMinPurchaseAmt()));
  	// Get total amount of wei that can be spent and number of tokens purchased
  	uint spend_amount;
  	uint tokens_purchased;
  	(spend_amount, tokens_purchased) = getPurchaseInfo(
  	  uint(Contract.read(Sale.tokenDecimals())),
  	  current_rate,
  	  uint(Contract.read(Sale.tokensRemaining())),
  	  sale_is_whitelisted,
  	  uint(Contract.read(Sale.whitelistMaxTok(Contract.sender()))),
  	  min_contribution
  	);
    // Sanity checks -
    assert(spend_amount != 0 && spend_amount <= msg.value && tokens_purchased != 0);
    // Set up payment buffer -
    Contract.paying();
    // Forward spent wei to team wallet -
    Contract.pay(spend_amount).toAcc(address(Contract.read(Sale.wallet())));
    // Move buffer to storing values -
    Contract.storing();
  	// Update purchaser's token balance -
  	Contract.increase(Sale.balances(Contract.sender())).by(tokens_purchased);
  	// Update tokens remaining in sale -
  	Contract.decrease(Sale.tokensRemaining()).by(tokens_purchased);
    // Update total tokens sold -
    Contract.increase(Sale.tokensSold()).by(tokens_purchased);
  	// Update total wei raised -
  	Contract.increase(Sale.totalWeiRaised()).by(spend_amount);
    // If the sender had not previously contributed to the sale,
    // increase unique contributor count and mark the sender as having contributed
  	if (sender_has_contributed == false) {
  	  Contract.increase(Sale.contributors()).by(1);
  	  Contract.set(Sale.hasContributed(Contract.sender())).to(true);
  	}
    // If the sale is whitelisted, update the spender's whitelist information -
	  if (sale_is_whitelisted) {
	    Contract.set(Sale.whitelistMinTok(Contract.sender())).to(uint(0));
      Contract.decrease(Sale.whitelistMaxTok(Contract.sender())).by(tokens_purchased);
	  }
  	Contract.emitting();
  	// Add purchase signature and topics
  	Contract.log(
  	  PURCHASE(Contract.execID(), current_rate), bytes32(tokens_purchased)
  	);
  }
}