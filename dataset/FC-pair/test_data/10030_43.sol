contract c10030{
    /*
     * @dev Returns the properties of a bet for a match
     * @param _matchId   the index of that match in the matches array
     * @param _betId     the index of that bet in the match bets array
     * @return `address` the address that placed the bet and thus it's owner
     * @return `uint`    the amount that was bet
     * @return `uint`    the option that was bet on
     * @return `bool`    wether or not the bet had been cancelled
     */ 
    function getBet(uint8 _matchId, uint _betId) public view validBet(_matchId, _betId) returns (address, uint, uint, bool, bool) {
        Bet memory bet = matches[_matchId].bets[_betId];
        // Don't return matchId and betId since you had to know them in the first place
        return (bet.better, bet.amount, bet.option, bet.cancelled, bet.claimed);
    } 
}