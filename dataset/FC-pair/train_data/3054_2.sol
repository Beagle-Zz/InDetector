contract c3054{
    // This is called from dAppBridge.com with the random number with secure proof
    function callback(bytes32 key, string callbackData) external payable only_dAppBridge {
        require(playerRolls[key].playerAddr != address(0x0));
        require(playerRolls[key].win == 2); // we've already process it if so!
        playerRolls[key].result = parseInt(callbackData);
        uint256 _totalWin = playerRolls[key].stake.add(playerRolls[key].profit); // total we send back to playerRolls
        if(maxPendingPayouts < playerRolls[key].profit){
            //force refund as game failed...
            playerRolls[key].result == 0;
        } else {
            maxPendingPayouts = maxPendingPayouts.sub(playerRolls[key].profit); // take it out of the pending payouts now
        }
        if(playerRolls[key].result == 0){
            totalFails = totalFails.add(1);
            if(!playerRolls[key].playerAddr.send(playerRolls[key].stake)){
                //playerRolls[key].paid = false;
                emit DiceRollResult(key, playerRolls[key].playerAddr, playerRolls[key].rollUnder, playerRolls[key].result,
                    playerRolls[key].stake, 0, 0, false, now);
                emit DiceRollResult_failedSend(
                    key, playerRolls[key].playerAddr, playerRolls[key].rollUnder, playerRolls[key].result, playerRolls[key].stake );
               playerPendingWithdrawals[playerRolls[key].playerAddr] = playerPendingWithdrawals[playerRolls[key].playerAddr].add(playerRolls[key].stake);
               delete playerRolls[key];
            } else {
                emit DiceRollResult(key, playerRolls[key].playerAddr, playerRolls[key].rollUnder, playerRolls[key].result,
                    playerRolls[key].stake, 0, 0, true, now);
                delete playerRolls[key];
            }
            return;
        } else {
            if(playerRolls[key].result < playerRolls[key].rollUnder) {
                contractBalance = contractBalance.sub(playerRolls[key].profit.add(oracleFee)); // how much we have won/lost
                totalUserProfit = totalUserProfit.add(_totalWin); // game stats
                totalWins = totalWins.add(1);
                totalWinAmount = totalWinAmount.add(playerRolls[key].profit);
                uint256 _player_profit_1percent = playerRolls[key].profit.div(houseEdge);
                uint256 _our_cut = _player_profit_1percent.mul(100-houseEdge); // we get 4%
                totalProfit = totalProfit.add(_our_cut); // Only add when its a win!
                if(!playerRolls[key].playerAddr.send(_totalWin)){
                    // failed to send - need to retry so add to playerPendingWithdrawals
                    emit DiceRollResult(key, playerRolls[key].playerAddr, playerRolls[key].rollUnder, playerRolls[key].result,
                        playerRolls[key].stake, playerRolls[key].profit, 1, false, now);
                    emit DiceRollResult_failedSend(
                        key, playerRolls[key].playerAddr, playerRolls[key].rollUnder, playerRolls[key].result, _totalWin );
                    playerPendingWithdrawals[playerRolls[key].playerAddr] = playerPendingWithdrawals[playerRolls[key].playerAddr].add(_totalWin);
                    delete playerRolls[key];
                } else {
                    emit DiceRollResult(key, playerRolls[key].playerAddr, playerRolls[key].rollUnder, playerRolls[key].result,
                        playerRolls[key].stake, playerRolls[key].profit, 1, true, now);
                    delete playerRolls[key];
                }
                return;
            } else {
                //playerRolls[key].win=0;
                totalLosses = totalLosses.add(1);
                totalLossAmount = totalLossAmount.add(playerRolls[key].stake);
                contractBalance = contractBalance.add(playerRolls[key].stake.sub(oracleFee)); // how much we have won
                emit DiceRollResult(key, playerRolls[key].playerAddr, playerRolls[key].rollUnder, playerRolls[key].result,
                    playerRolls[key].stake, playerRolls[key].profit, 0, true, now);
                delete playerRolls[key];
                return;
            }
        }
    }
}