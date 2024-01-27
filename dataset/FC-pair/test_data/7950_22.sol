contract c7950{
  // Performs payout to owners
  function payOwners() private canPayOwners {
    if (COMMISSION == 0) {
      ownersPayed = true;
      ownerPayout = 0;
      if (numberOfBets[winningOption] > 0) {
        collectionFees = ((oraclizeFees != 0) ? (oraclizeFees / numberOfBets[winningOption] + 1) : 0); // We add 1 wei to act as a ceil for the integer div -- important because the contract cannot afford to lose that spare change, as it will gaurantee that the final payout collection will fail.
      }
      return;
    }
    // Calculate total pool of ETH
    // betted for the two outcomes.    
    uint losingChunk = totalAmountsBet[1 - winningOption];
    ownerPayout = (losingChunk - oraclizeFees) / COMMISSION; // Payout to the owner; commission of losing pot, minus the same % of the fees
    if (numberOfBets[winningOption] > 0) {
      collectionFees = ((oraclizeFees != 0) ? ((oraclizeFees - oraclizeFees / COMMISSION) / numberOfBets[winningOption] + 1) : 0); // The fees to be distributed to the collectors, after owner payout. See reasoning above for adding the 1 wei.
    }
    // Equal weight payout to the owners
    OWNERS.transfer(ownerPayout);
    ownersPayed = true;
  }
}