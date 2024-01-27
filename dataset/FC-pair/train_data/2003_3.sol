contract c2003{
    /*
    * Pay winners, update contract balance, send rewards where applicable.
    */
    function _finishSpin(address target)
        private returns (uint)
    {
        playerSpin memory spin = playerSpins[target];
        require(spin.tokenValue > 0); // No re-entrancy
        require(spin.blockn != block.number);
        uint profit = 0;
        // If the block is more than 255 blocks old, we can't get the result
        // Also, if the result has already happened, fail as well
        uint result;
        if (block.number - spin.blockn > 255) {
          result = 9999; // Can't win: default to largest number
        } else {
          // Generate a result - random based ONLY on a past block (future when submitted).
          // Case statement barrier numbers defined by the current payment schema at the top of the contract.
          result = random(10000, spin.blockn, target);
        }
        if (result > 4489) {
          // Player has lost.
          emit Loss(target);
          emit LogResult(target, result, profit, spin.tokenValue, false);
        } else {
            if (result < 29) {
                // Player has won the 25x jackpot
                profit = SafeMath.mul(spin.tokenValue, 25);
                emit Jackpot(target);
            } else {
                if (result < 233) {
                    // Player has won a 8x multiplier
                    profit = SafeMath.mul(spin.tokenValue, 8);
                    emit EightXMultiplier(target);
                } else {
                    if (result < 641) {
                        // Player has won their wager back
                        profit = spin.tokenValue;
                        emit ReturnBet(target);
                    } else {
                        if (result < 1865) {
                            // Player has won a 2.5x multiplier
                            profit = SafeMath.div(SafeMath.mul(spin.tokenValue, 25), 10);
                            emit TwoAndAHalfXMultiplier(target);
                        } else {
                            // Player has won a 1.5x multiplier (result lies between 1865 and 4489
                            profit = SafeMath.div(SafeMath.mul(spin.tokenValue, 15), 10);
                            emit OneAndAHalfXMultiplier(target);
                        }
                    }
                }
            }
            emit LogResult(target, result, profit, spin.tokenValue, true);
            contractBalance = contractBalance.sub(profit);
            ZTHTKN.transfer(target, profit);
        }
        playerSpins[target] = playerSpin(uint200(0), uint48(0));
        return result;
    }
}