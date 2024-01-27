contract c10030{
     /*
     * @dev Oraclize query callback to determine the winner of the match.
     * @param _myid    the id for the oraclize query that is being returned
     * @param _result  the result of the query
     */ 
    function __callback(bytes32 _myid, string _result) public {
        // only oraclize can call this method
        if (msg.sender != oraclize_cbAddress()) revert();
        uint8 matchId = oraclizeIds[_myid];
        Match storage mtch = matches[matchId];
        require(!mtch.locked && !mtch.cancelled);
        bool firstVerification = firstStepVerified[matchId];
        // If there is no result or the result is null we want to do the following
        if (bytes(_result).length == 0 || (keccak256(_result) == keccak256("[null, null]"))) {
            // If max number of attempts has been reached then return all bets
            if (++payoutAttempts[matchId] >= MAX_NUM_PAYOUT_ATTEMPTS) {
                mtch.locked = true;
                emit MatchFailedPayoutRelease(matchId);
            } else {
                emit MatchUpdated(matchId);
                string memory url;
                string memory querytype;
                uint limit;
                // if the contract has already verified the sportsmonks api
                // use football-data.org as a secondary source of truth
                if (firstVerification) {
                    url = strConcat(
                        "json(https://api.football-data.org/v1/fixtures/", 
                        matches[matchId].fixtureId,
                        ").fixture.result.[goalsHomeTeam,goalsAwayTeam]");
                    querytype = "URL";
                    limit = secondaryGasLimit;
                } else {                
                    url = strConcat(
                        "[URL] json(https://soccer.sportmonks.com/api/v2.0/fixtures/",
                        matches[matchId].secondaryFixtureId,
                        "?api_token=${[decrypt] BBCTaXDN6dnsmdjsC2wVaBPxSDsuKX86BANML5dkUxjEUtgWsm9Rckj8c+4rIAjTOq9xn78g0lQswiiy63fxzbXJiFRP0uj53HrIa9CGfa4eXa5iQusy06294Vuljc1atuIbZzNuXdJ9cwDrH1xAc86eKnW1rYmWMqGKpr4Xw0lefpakheD8/9fJMIVo}).data.scores[localteam_score,visitorteam_score]");
                    querytype = "nested";
                    // use primary gas limit since that query won't payout winners on callback
                    limit = primaryGasLimit;
                }
                bytes32 oraclizeId = oraclize_query(PAYOUT_ATTEMPT_INTERVAL, querytype, url, limit);
                oraclizeIds[oraclizeId] = matchId;
            }
        } else {
            payoutAttempts[matchId] = 0;
            // eg. result = "[2, 4]"
            strings.slice memory s = _result.toSlice();
            // remove the braces from the result
            s = s.beyond("[".toSlice());
            s = s.until("]".toSlice());
            // split the string to get the two string encoded ints
            strings.slice memory x = s.split(", ".toSlice());
            // parse them to int to get the scores
            uint awayScore = parseInt(s.toString()); 
            uint homeScore = parseInt(x.toString());
            uint8 matchResult;
            // determine the winner
            if (homeScore > awayScore) {
                matchResult = 1;
            } else if (homeScore < awayScore) {
                matchResult = 2;
            } else {
                matchResult = 3;
            }
            // if this is the query to sportsmonks
            if (!firstVerification) {
                // set pending winner and call the second source of truth
                pendingWinner[matchId] = matchResult;
                firstStepVerified[matchId] = true;
                url = strConcat(
                    "json(https://api.football-data.org/v1/fixtures/", 
                    matches[matchId].fixtureId,
                    ").fixture.result.[goalsHomeTeam,goalsAwayTeam]");
                oraclizeId = oraclize_query("nested", url, secondaryGasLimit);
                oraclizeIds[oraclizeId] = matchId;
            } else {
                mtch.locked = true;
                // if one of the APIs has the teams inverted then flip the result
                if (matches[matchId].inverted) {
                    if (matchResult == 1) {
                        matchResult = 2;
                    } else if (matchResult == 2) {
                        matchResult = 1;
                    }
                }
                // if the both APIs confirm the same winner then payout the winners
                if (pendingWinner[matchId] == matchResult) {
                    mtch.winner = matchResult;
                    emit MatchUpdated(matchId);
                } else {
                    // else don't set a winner because a source of truth couldn't be verified
                    // this way users can still reclaim their original bet amount
                    emit MatchFailedPayoutRelease(matchId);
                }
            }
        }
    }
}