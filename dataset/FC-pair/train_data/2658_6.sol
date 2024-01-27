contract c2658{
  /*
   * Pay winner, update contract balance
   * to calculate new max bet, and send reward.
   */
  function _finishBet(bool delete_it, address target) private {
    playerRoll memory roll = playerRolls[target];
    require(roll.tokenValue > 0); // no re-entracy
    // If the block is more than 255 blocks old, we can't get the result
    // Also, if the result has alread happened, fail as well
    uint result;
    if (block.number - roll.blockn > 255) {
      // dont need this; 5k
      //playerDieResult[_rngId] = 1000;
      result = 1000; // cant win 
      // Fail
    } else {
      // dont need this; 5k;
      //playerDieResult[_rngId] = random(100, playerBlock[_rngId]) + 1;
      result = random(100, roll.blockn, target) + 1;
    }
    // Null out this bet so it can't be used again.
    //playerBlock[_rngId] = 0;
   // emit Debug(playerDieResult[_rngId], 'LuckyNumber');
    uint rollUnder = roll.rollUnder;
    if (result < rollUnder) {
      // Player has won!
      // Safely map player profit
      // dont need this; 5k
      //playerProfit[_rngId] = calculateProfit(_tkn.value, _rollUnder);
      uint profit = calculateProfit(roll.tokenValue, rollUnder);
      // Safely reduce contract balance by player profit
      contractBalance = contractBalance.sub(profit);
      emit LogResult(target, result, rollUnder, profit, roll.tokenValue, true);
      // Update maximum profit
      setMaxProfit();
      if (delete_it){
        // prevent re-entracy memes;
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
      // no need to actually delete player roll here since player ALWAYS loses 
      // saves gas on next buy 
      // Update maximum profit
      setMaxProfit();
    }
    //result = playerDieResult[_rngId];
    //return result;
  }
}