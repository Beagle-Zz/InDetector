contract c11078{
    /*
     * @dev Returns some of the properties of a match. Functionality had to be seperated
     *      into 2 function calls to prevent stack too deep errors
     * @param _matchId   the index of that match in the matches array
     * @return `string`  the match name
     * @return `string`  the fixutre Id of the match for the football-data endpoint
     * @return `string`  the fixture Id fo the match for the sports monk endpoint
     * @return `uint8`   the index of the home team
     * @return `uint8`   the index of the away team
     * @return `uint8`   the winner of the match
     * @return `uint`    the unix timestamp for the match start time
     * @return `bool`    Match cancelled boolean
     * @return `bool`    Match locked boolean which is set to true if the match is payed out or bets are returned
     */ 
    function getMatch(uint8 _matchId) public view validMatch(_matchId) returns (string, string, string, bool, uint8, uint8, uint8, uint, bool, bool) {
        Match memory mtch = matches[_matchId];
        return (
            mtch.name,
            mtch.fixtureId, 
            mtch.secondaryFixtureId,
            mtch.inverted,
            mtch.teamA, 
            mtch.teamB,
            mtch.winner, 
            mtch.start,
            mtch.cancelled,
            mtch.locked
        );
    }
}