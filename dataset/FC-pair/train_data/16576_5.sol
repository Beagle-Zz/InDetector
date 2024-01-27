contract c16576{
    /*
     * public function
     * player submit bet
     * only if game is active & bet is valid
    */
    function playerMakeBet(uint minRollLimit, uint maxRollLimit, bytes32 diceRollHash, uint8 v, bytes32 r, bytes32 s) public
    payable
    gameIsActive
    betIsValid(msg.value, minRollLimit, maxRollLimit)
    {
        /* checks if bet was already made */
        if (playerBetDiceRollHash[diceRollHash] != 0x0 || diceRollHash == 0x0) throw;
        /* checks bet sign */
        tempBetHash = sha256(diceRollHash, byte(minRollLimit), byte(maxRollLimit), msg.sender);
        if (casino != ecrecover(tempBetHash, v, r, s)) throw;
        tempFullprofit = getFullProfit(msg.value, minRollLimit, maxRollLimit);
        playerProfit[diceRollHash] = getProfit(msg.value, tempFullprofit);
        playerToJackpot[diceRollHash] = getToJackpot(msg.value, tempFullprofit);
        if (playerProfit[diceRollHash] - playerToJackpot[diceRollHash] > maxProfit)
            throw;
        /* map bet id to serverSeedHash */
        playerBetDiceRollHash[diceRollHash] = diceRollHash;
        /* map player limit to serverSeedHash */
        playerMinRollLimit[diceRollHash] = minRollLimit;
        playerMaxRollLimit[diceRollHash] = maxRollLimit;
        /* map value of wager to serverSeedHash */
        playerBetValue[diceRollHash] = msg.value;
        /* map player address to serverSeedHash */
        playerAddress[diceRollHash] = msg.sender;
        /* safely increase maxPendingPayouts liability - calc all pending payouts under assumption they win */
        maxPendingPayouts = safeAdd(maxPendingPayouts, playerProfit[diceRollHash]);
        /* check contract can payout on win */
        if (maxPendingPayouts >= contractBalance)
            throw;
        /* provides accurate numbers for web3 and allows for manual refunds in case of any error */
        LogBet(diceRollHash, playerAddress[diceRollHash], playerProfit[diceRollHash], playerToJackpot[diceRollHash],
            playerBetValue[diceRollHash], playerMinRollLimit[diceRollHash], playerMaxRollLimit[diceRollHash]);
    }
}