contract c67{
  // Returns information about the current crowdsale tier by time, so that storage can be updated
  function updateTier(uint _ends_at, uint _current_tier, uint _num_tiers) private view
  returns (
    uint tokens_remaining,
    uint purchase_price,
    bool tier_is_whitelisted,
    uint tier_ends_at,
    uint current_tier
  ) {
    // While the current timestamp is beyond the current tier's end time,
    // and while the current tier's index is within a valid range:
    while (now >= _ends_at && ++_current_tier < _num_tiers) {
      // Read tier remaining tokens -
      tokens_remaining = uint(Contract.read(Sale.tierCap(_current_tier)));
      // Read tier price -
      purchase_price = uint(Contract.read(Sale.tierPrice(_current_tier)));
      // Read tier duration -
      uint tier_duration = uint(Contract.read(Sale.tierDuration(_current_tier)));
      // Read tier 'whitelisted' status -
      tier_is_whitelisted
        = Contract.read(Sale.tierWhitelisted(_current_tier)) == bytes32(1) ? true : false;
      // Ensure valid tier setup -
      if (tokens_remaining == 0 || purchase_price == 0 || tier_duration == 0)
        revert('invalid tier');
      _ends_at = _ends_at.add(tier_duration);
    }
    // If the updated current tier's index is not in the valid range, or the
    // end time is still in the past, throw
    if (now >= _ends_at || _current_tier >= _num_tiers)
      revert('crowdsale finished');
    // Set return values -
    tier_ends_at = _ends_at;
    current_tier = _current_tier;
  }
}