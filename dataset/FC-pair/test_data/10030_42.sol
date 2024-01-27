contract c10030{
    /*
     * @dev Adds a new bet to a match with the outcome passed where there are 3 possible outcomes
     *      homeTeam wins(1), awayTeam wins(2), draw(3). While it is possible for some matches
     *      to end in a draw, not all matches will have the possibility of ending in a draw
     *      this functionality will be added in front end code to prevent betting on invalid decisions.
     *      Emits a BetPlaced event.
     * @param _matchId   the index of the match in matches that the bet is for
     * @param _outcome   the possible outcome for the match that this bet is betting on 
     * @return `uint`    the Id of the bet in a match's bet array
     */ 
    function placeBet(uint8 _matchId, uint8 _outcome) public payable validMatch(_matchId) returns (uint) {
        Match storage mtch = matches[_matchId];
        // A bet must be a valid option, 1, 2, or 3, and cannot be less that the minimum bet amount
        require(
            !mtch.locked &&
            !mtch.cancelled &&
            now < mtch.closeBettingTime &&
            _outcome > 0 && 
            _outcome < 4 && 
            msg.value >= minimum_bet
        );
        Bet memory bet = Bet(false, false, msg.value, _outcome, msg.sender);
        uint betId = mtch.numBets;
        mtch.bets[betId] = bet;
        mtch.numBets++;
        if (_outcome == 1) {
            mtch.totalTeamABets += msg.value;
            // a bit of safe math checking here
            assert(mtch.totalTeamABets >= msg.value);
        } else if (_outcome == 2) {
            mtch.totalTeamBBets += msg.value;
            assert(mtch.totalTeamBBets >= msg.value);
        } else {
            mtch.totalDrawBets += msg.value;
            assert(mtch.totalDrawBets >= msg.value);
        }
        // emit bet placed event
        emit BetPlaced(_matchId, _outcome, betId, msg.value, msg.sender);
        return (betId);
    }
}