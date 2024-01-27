contract c10103{
    // Keeping this open for anyone to update anyone else so that at the end of
    // the tournament we can force a score update for everyone using a script.
    function updateScore(address _participant)
        public
    {
        int8                     lastPlayed     = latestGameFinished;
        require(lastPlayed > 0);
        // Most recent game scored for this participant.
        int8                     lastScored     = playerGamesScored[_participant];
        // Most recent game played in the tournament (sets bounds for scoring iteration).
        mapping (int8 => bool)   madePrediction = playerMadePrediction[_participant];
        mapping (int8 => string) playerGuesses  = playerPredictions[_participant];
        for (int8 i = lastScored; i < lastPlayed; i++) {
            uint j = uint(i);
            uint k = j.add(1);
            uint streak = playerStreak[_participant];
            emit StartScoring(_participant, k);
            if (!madePrediction[int8(k)]) {
                playerPointArray[_participant][j] = 0;
                playerStreak[_participant]        = 0;
                emit DidNotPredict(_participant, k);
            } else {
                string storage playerResult = playerGuesses[int8(k)];
                string storage actualResult = gameResult[int8(k)];
                bool correctGuess = equalStrings(playerResult, actualResult);
                emit Comparison(_participant, k, playerResult, actualResult, correctGuess);
                 if (!correctGuess) {
                     // The guess was wrong.
                     playerPointArray[_participant][j] = 0;
                     playerStreak[_participant]        = 0;
                 } else {
                     // The guess was right.
                     streak = streak.add(1);
                     playerStreak[_participant] = streak;
                     if (streak >= 5) {
                         // On a long streak - four points.
                        playerPointArray[_participant][j] = 4;
                     } else {
                         if (streak >= 3) {
                            // On a short streak - two points.
                            playerPointArray[_participant][j] = 2;
              }
                         // Not yet at a streak - standard one point.
                         else { playerPointArray[_participant][j] = 1; }
                     }
                 }
            }
        }
        playerGamesScored[_participant] = lastPlayed;
    }
}