contract c16217{
  /**
   * Updates the user shares depending on the difference between final and initial stake.
   * For doing so, it iterates over the array of stakeholders, while it processes max 500 addresses at once.
   * If the array length is bigger than that, the contract remembers the position to start with on the next invocation.
   * Therefore, this method might need to be called multiple times.
   * It does consider the gas costs and subtracts them from the final stakes before computing the profit/loss.
   * As soon as the last stake has been updated, withdrawals are unlocked by setting the totalStakes to the height of final stakes of the cycle.
   * */
  function updateUserShares() public onlyAuthorized updatePhase {
    uint limit = safeAdd(lastUpdateIndex[cycle], maxUpdates);
    if(limit >= numHolders) {
      limit = numHolders;
      totalStakes = finalStakes[cycle]; //enable withdrawals after this method call was processed
      if (cycle > 1) {
        lastUpdateIndex[cycle - 1] = 0;
      }
    }
    address holder;
    uint newStake;
    for(uint i = lastUpdateIndex[cycle]; i < limit; i++){
      holder = stakeholders[i];
      newStake = computeFinalStake(stakes[holder]);
      stakes[holder] = newStake;
      emit StakeUpdate(holder, newStake);
    }
    lastUpdateIndex[cycle] = limit;
  }
}