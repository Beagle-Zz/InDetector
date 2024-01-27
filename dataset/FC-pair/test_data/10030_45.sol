contract c10030{
    /*
     * @dev Betters can claim there winnings using this method or reclaim their bet
     *      if the match was cancelled
     * @param _matchId   the index of the match in the matches array
     * @param _betId     the bet being claimed
     */ 
    function claimBet(uint8 _matchId, uint8 _betId) public validBet(_matchId, _betId) {
        Match storage mtch = matches[_matchId];
        Bet storage bet = mtch.bets[_betId];
        // ensures the match has been locked (payout either done or bets returned)
        // dead man's switch to prevent bets from ever getting locked in the contrat
        // from insufficient funds during an oracalize query
        // if the match isn't locked or cancelled, then you can claim your bet after
        // the world cup is over (noon July 16)
        require((mtch.locked || now >= 1531742400) &&
            !bet.claimed &&
            !bet.cancelled &&
            msg.sender == bet.better
        );
        bet.claimed = true;
        if (mtch.winner == 0) {
            // If the match is locked with no winner set
            // then either it was cancelled or a winner couldn't be determined
            // transfer better back their bet amount
            bet.better.transfer(bet.amount);
        } else {
            if (bet.option != mtch.winner) {
                return;
            }
            uint totalPool;
            uint winPool;
            if (mtch.winner == 1) {
                totalPool = mtch.totalTeamBBets + mtch.totalDrawBets;
                // once again do some safe math
                assert(totalPool >= mtch.totalTeamBBets);
                winPool = mtch.totalTeamABets;
            } else if (mtch.winner == 2) {
                totalPool = mtch.totalTeamABets + mtch.totalDrawBets;
                assert(totalPool >= mtch.totalTeamABets);
                winPool = mtch.totalTeamBBets;
            } else {
                totalPool = mtch.totalTeamABets + mtch.totalTeamBBets;
                assert(totalPool >= mtch.totalTeamABets);
                winPool = mtch.totalDrawBets;
            }
            uint winnings = totalPool * bet.amount / winPool;
            // calculate commissions percentage
            uint commission = winnings / 100 * commission_rate;
            commissions += commission;
            assert(commissions >= commission);
            // return original bet amount + winnings - commission
            bet.better.transfer(winnings + bet.amount - commission);
        }
        emit BetClaimed(_matchId, _betId);
    }
}