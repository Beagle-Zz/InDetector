contract c13375{
    /**
     *  If both palayer(s) does(-es) not claim reward in time 
     *  they loose their chance to claim reward.
     *  Game earnings are calculated as if this gets executed successully,
     *  both players have claimed rewards eseentialy.      
     */
    function ownerClaimOverride(uint _gameNumber) private returns(bool _overriden) {
        Game storage game = games[_gameNumber-1];
        if ( game.lastGameFinished) {
            if (now > (game.finishTime + game.stageTimeout)) {
                if(!game.claimedReward[game.player1] && !game.claimedReward[game.player1]) {
                    game.claimedReward[game.player1] = true;
                    game.reward[game.player1] = 0;
                    game.claimedReward[game.player2] = true;
                    game.reward[game.player2] = 0;
                } else if (game.claimedReward[game.player1] && !game.claimedReward[game.player2]) {
                    game.claimedReward[game.player2] = true;
                    game.reward[game.player2] = 0;
                } else if (!game.claimedReward[game.player1] && game.claimedReward[game.player2]) {           
                    game.claimedReward[game.player1] = true;
                    game.reward[game.player1] = 0;
                } else {
                    //Both players have alreay claimed reward.
                    return false;
                }
                uint256 totalBet = (game.bets[game.player1].betAmount + game.bets[game.player2].betAmount);
                uint gameEarnings = totalBet - game.reward[game.player1] - game.reward[game.player2];
                contractEarnings = contractEarnings + gameEarnings;
                emit ContractEarnings(_gameNumber, gameEarnings, "OWNER_CLAIM_OVERRIDE");
            }
        }
    }
}