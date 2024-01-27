contract c2638{
  /*
   * Pay winner, update contract balance
   * to calculate new max bet, and send reward.
   */
  function _finishBet(bool delete_it, address target) private {
    playerRoll memory roll = playerRolls[target];
    require(roll.tokenValue > 0); // No re-entracy
    // If the block is more than 255 blocks old, we can't get the result
    // Also, if the result has already happened, fail as well
    uint result;
    if (block.number - roll.blockn > 255) {
      result = 1000; // Cant win 
    } else {
      // Grab the result - random based ONLY on a past block (future when submitted)
      result = random(100, roll.blockn, target) + 1;
    }
    uint rollUnder = roll.rollUnder;
    if (result < rollUnder) {
      // Player has won!
      // Safely map player profit
      uint profit = calculateProfit(roll.tokenValue, rollUnder);
      // Safely reduce contract balance by player profit
      contractBalance = contractBalance.sub(profit);
      emit LogResult(target, result, rollUnder, profit, roll.tokenValue, true);
      // Update maximum profit
      setMaxProfit();
      if (delete_it){
        // Prevent re-entracy memes
        delete playerRolls[target];
      }
      // Transfer profit plus original bet
      ZTHTKN.transfer(target, profit + roll.tokenValue);
    } else {
      /*
      * Player has lost
      * Update contract balance to calculate new max bet
      */
      emit LogResult(target, result, rollUnder, profit, roll.tokenValue, false);
      /*
      *  Safely adjust contractBalance
      *  SetMaxProfit
      */
      contractBalance = contractBalance.add(roll.tokenValue);
      // No need to actually delete player roll here since player ALWAYS loses 
      // Saves gas on next buy 
      // Update maximum profit
      setMaxProfit();
    }
  }
}