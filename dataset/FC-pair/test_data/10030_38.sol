contract c10030{
    /*
     * @dev Adds a new match to the smart contract and schedules an oraclize query call
     *      to determine the winner of a match within 3 hours. Additionally emits an event
     *      signifying a match was created.
     * @param _name      the unique identifier of the match, should be of format Stage:Team A vs Team B
     * @param _fixture   the fixtureId for the football-data.org endpoint
     * @param _secondary the fixtureId for the sportsmonk.com endpoint
     * @param _inverted  should be set to true if the teams are inverted on either of the API 
     *                   that is if the hometeam and localteam are swapped
     * @param _teamA     index of the homeTeam from the TEAMS array
     * @param _teamB     index of the awayTeam from the TEAMS array
     * @param _start     the unix timestamp for when the match is scheduled to begin
     * @return `uint`     the Id of the match in the matches array
     */ 
    function addMatch(string _name, string _fixture, string _secondary, bool _invert, uint8 _teamA, uint8 _teamB, uint _start) public onlyOwner returns (uint8) {
        // Check that there's at least 15 minutes until the match starts
        require(_teamA < 32 && _teamB < 32 && _teamA != _teamB);
        Match memory newMatch = Match({
            locked: false, 
            cancelled: false, 
            teamA: _teamA,
            teamB: _teamB, 
            winner: 0,
            fixtureId: _fixture, // The primary fixtureId that will be used to query the football-data API
            secondaryFixtureId: _secondary, // The secondary fixtureID used to query sports monk
            inverted: _invert,
            start: _start, 
            closeBettingTime: _start - 3 minutes, // betting closes 3 minutes before a match starts
            totalTeamABets: 0, 
            totalTeamBBets: 0, 
            totalDrawBets: 0, 
            numBets: 0,
            name: _name
        });
        uint8 matchId = uint8(matches.push(newMatch)) - 1;
        // concatinate oraclize query
        string memory url = strConcat(
            "[URL] json(https://soccer.sportmonks.com/api/v2.0/fixtures/",
            newMatch.secondaryFixtureId,
            "?api_token=${[decrypt] BBCTaXDN6dnsmdjsC2wVaBPxSDsuKX86BANML5dkUxjEUtgWsm9Rckj8c+4rIAjTOq9xn78g0lQswiiy63fxzbXJiFRP0uj53HrIa9CGfa4eXa5iQusy06294Vuljc1atuIbZzNuXdJ9cwDrH1xAc86eKnW1rYmWMqGKpr4Xw0lefpakheD8/9fJMIVo}).data.scores[localteam_score,visitorteam_score]");
        // store the oraclize query id for later use
        // use hours to over estimate the amount of time it would take to safely get a correct result
        // 90 minutes of regulation play time + potential 30 minutes of extra time + 15 minutes break
        // + potential 10 minutes of stoppage time + potential 10 minutes of penalties
        // + 25 minutes of time for any APIs to correct and ensure their information is correct
        uint start = (_start + 3 hours);
        if (start <= now) {
            start = 1 minutes;
        }
        bytes32 oraclizeId = oraclize_query(start, "nested", url, primaryGasLimit);
        oraclizeIds[oraclizeId] = matchId;
        emit MatchCreated(matchId);
        return matchId;
    }
}