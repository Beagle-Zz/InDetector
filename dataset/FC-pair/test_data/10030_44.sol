contract c10030{
    /*
     * @dev Cancel's a bet and returns the amount - commission fee. Emits a BetCancelled event
     * @param _matchId   the index of that match in the matches array
     * @param _betId     the index of that bet in the match bets array
     */ 
    function cancelBet(uint8 _matchId, uint _betId) public validBet(_matchId, _betId) {
        Match memory mtch = matches[_matchId];
        require(!mtch.locked && now < mtch.closeBettingTime);
        Bet storage bet = matches[_matchId].bets[_betId];
        // only the person who made this bet can cancel it
        require(!bet.cancelled && !bet.claimed && bet.better == msg.sender );
        // stop re-entry just in case of malicious attack to withdraw all contract eth
        bet.cancelled = true;
        uint commission = bet.amount / 100 * commission_rate;
        commissions += commission;
        assert(commissions >= commission);
        if (bet.option == 1) {
            matches[_matchId].totalTeamABets -= bet.amount;
        } else if (bet.option == 2) {
            matches[_matchId].totalTeamBBets -= bet.amount;
        } else if (bet.option == 3) {
            matches[_matchId].totalDrawBets -= bet.amount;
        }
        bet.better.transfer(bet.amount - commission);
        emit BetCancelled(_matchId, _betId);
    }
}