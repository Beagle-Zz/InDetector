contract c13375{
    //REWARD WITHDRAW ENDS
    //OWNER OVERRIDE SECTION STARTS
    /** 
     *  Give back to game creator instead of consuming to contract.
     *  So in case Game owner has PTSD and wants al game finished,
     *  Game owner will call this on game which is in registeration open
     *  state since past stage timeout.
     *  Do some good :)
     *  ALTHOUGH if game creator wants to abandon after stage timeout
     *  No fees is charged. See claimReward Method for that.
     */
    function ownerAbandonOverride(uint _gameNumber) private returns(bool _overriden) {
        Game storage game = games[_gameNumber-1];
        if (game.registerationOpen) {
            if (now > (game.startTime + game.stageTimeout)) {
                game.claimedReward[game.player1] = true;
                game.registerationOpen = false;
                game.lastGameFinished = true;
                game.reward[game.player1] = game.bets[game.player1].betAmount; 
                //Do not cut commision as no one came to play. 
                //This also incentivisies users to keep the game open for long time.
                ethTransfer(_gameNumber, game.player1, game.bets[game.player1].betAmount);
                return true;
            }                  
        }      
        return false;
    }
}