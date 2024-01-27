contract c18819{
  // The configuration from the constructor was moved to the configurationTokenTranchePricing function.
  //
  /// @dev Construction, creating a list of tranches
  /* @param init_tranches Raw array of ordered tuples: (start amount, start timestamp, end timestamp, price) */
  //
  function configurationTokenTranchePricing(uint[] init_tranches) internal {
    // Need to have tuples, length check
    require(init_tranches.length % tranche_size == 0);
    // A tranche with amount zero can never be selected and is therefore useless.
    // This check and the one inside the loop ensure no tranche can have an amount equal to zero.
    require(init_tranches[amount_offset] > 0);
    uint input_tranches_length = init_tranches.length.div(tranche_size);
    Tranche memory last_tranche;
    for (uint i = 0; i < input_tranches_length; i++) {
      uint tranche_offset = i.mul(tranche_size);
      uint amount = init_tranches[tranche_offset.add(amount_offset)];
      uint start = init_tranches[tranche_offset.add(start_offset)];
      uint end = init_tranches[tranche_offset.add(end_offset)];
      uint price = init_tranches[tranche_offset.add(price_offset)];
      // No invalid steps
      require(start < end && now < end);
      // Bail out when entering unnecessary tranches
      // This is preferably checked before deploying contract into any blockchain.
      require(i == 0 || (end >= last_tranche.end && amount > last_tranche.amount) ||
              (end > last_tranche.end && amount >= last_tranche.amount));
      last_tranche = Tranche(amount, start, end, price);
      tranches.push(last_tranche);
    }
  }
}