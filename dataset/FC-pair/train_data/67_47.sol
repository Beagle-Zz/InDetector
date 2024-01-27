contract c67{
  // Implements the logic to create the storage buffer for a Crowdsale Purchase
  function buy() internal view {
    uint current_tier;
    uint tokens_remaining;
    uint purchase_price;
    uint tier_ends_at;
    bool tier_is_whitelisted;
    bool updated_tier;
    // Get information on the current tier of the crowdsale
    (
      current_tier,
      tokens_remaining,
      purchase_price,
      tier_ends_at,
      tier_is_whitelisted,
      updated_tier
    ) = getCurrentTier();
    // Declare amount of wei that will be spent, and amount of tokens that will be purchased
    uint amount_spent;
    uint amount_purchased;
    if (tier_is_whitelisted) {
      // If the tier is whitelisted, and the sender has contributed, get the spend and purchase
      // amounts with '0' as the minimum token purchase amount
      if (Contract.read(Sale.hasContributed(Contract.sender())) == bytes32(1)) {
        (amount_spent, amount_purchased) = getPurchaseInfo(
          uint(Contract.read(Sale.tokenDecimals())),
          purchase_price,
          tokens_remaining,
          uint(Contract.read(Sale.whitelistMaxTok(current_tier, Contract.sender()))),
          0,
          tier_is_whitelisted
        );
      } else {
        (amount_spent, amount_purchased) = getPurchaseInfo(
          uint(Contract.read(Sale.tokenDecimals())),
          purchase_price,
          tokens_remaining,
          uint(Contract.read(Sale.whitelistMaxTok(current_tier, Contract.sender()))),
          uint(Contract.read(Sale.whitelistMinTok(current_tier, Contract.sender()))),
          tier_is_whitelisted
        );
      }
    } else {
      // If the tier is not whitelisted, and the sender has contributed, get spend and purchase
      // amounts with '0' set as maximum spend and '0' as minimum purchase size
      if (Contract.read(Sale.hasContributed(Contract.sender())) != 0) {
        (amount_spent, amount_purchased) = getPurchaseInfo(
          uint(Contract.read(Sale.tokenDecimals())),
          purchase_price,
          tokens_remaining,
          0,
          0,
          tier_is_whitelisted
        );
      } else {
        (amount_spent, amount_purchased) = getPurchaseInfo(
          uint(Contract.read(Sale.tokenDecimals())),
          purchase_price,
          tokens_remaining,
          0,
          uint(Contract.read(Sale.tierMin(current_tier))),
          tier_is_whitelisted
        );
      }
    }
    // Set up payment buffer -
    Contract.paying();
    // Forward spent wei to team wallet -
    Contract.pay(amount_spent).toAcc(address(Contract.read(Sale.wallet())));
    // Move buffer to storing values -
    Contract.storing();
    // Update purchaser's token balance -
    Contract.increase(Sale.balances(Contract.sender())).by(amount_purchased);
    // Update total tokens sold during the sale -
    Contract.increase(Sale.tokensSold()).by(amount_purchased);
    // Mint tokens (update total supply) -
    Contract.increase(Sale.tokenTotalSupply()).by(amount_purchased);
    // Update total wei raised -
    Contract.increase(Sale.totalWeiRaised()).by(amount_spent);
    // If the sender had not previously contributed to the sale,
    // increase unique contributor count and mark the sender as having contributed
    if (Contract.read(Sale.hasContributed(Contract.sender())) == 0) {
      Contract.increase(Sale.contributors()).by(1);
      Contract.set(Sale.hasContributed(Contract.sender())).to(true);
    }
    // If the tier was whitelisted, update the spender's whitelist information -
    if (tier_is_whitelisted) {
      // Set new minimum purchase size to 0
      Contract.set(
        Sale.whitelistMinTok(current_tier, Contract.sender())
      ).to(uint(0));
      // Decrease maximum spend amount remaining by amount spent
      Contract.decrease(
        Sale.whitelistMaxTok(current_tier, Contract.sender())
      ).by(amount_purchased);
    }
    // If the 'current tier' needs to be updated, set storage 'current tier' information -
    if (updated_tier) {
      Contract.set(Sale.currentTier()).to(current_tier.add(1));
      Contract.set(Sale.currentEndsAt()).to(tier_ends_at);
      Contract.set(Sale.currentTokensRemaining()).to(tokens_remaining.sub(amount_purchased));
    } else {
      Contract.decrease(Sale.currentTokensRemaining()).by(amount_purchased);
    }
    // Move buffer to logging events -
    Contract.emitting();
    // Add PURCHASE signature and topics
    Contract.log(
      PURCHASE(Contract.sender(), current_tier), bytes32(amount_purchased)
    );
  }
}