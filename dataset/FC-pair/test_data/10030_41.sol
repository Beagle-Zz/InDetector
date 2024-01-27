contract c10030{
    /*
     * @dev Returns remaining of the properties of a match. Functionality had to be seperated
     *      into 2 function calls to prevent stack too deep errors
     * @param _matchId   the index of that match in the matches array
     * @return `uint`  timestamp for when betting for the match closes
     * @return `uint`  total size of the home team bet pool
     * @return `uint`  total size of the away team bet pool
     * @return `uint`  total size of the draw bet pool
     * @return `uint`  the total number of bets
     * @return `uint8` the number of payout attempts for the match
     */ 
    function getMatchBettingDetails(uint8 _matchId) public view validMatch(_matchId) returns (uint, uint, uint, uint, uint, uint8) {
        Match memory mtch = matches[_matchId];
        return (
            mtch.closeBettingTime,
            mtch.totalTeamABets, 
            mtch.totalTeamBBets, 
            mtch.totalDrawBets,
            mtch.numBets,
            payoutAttempts[_matchId]
        );
    }
}