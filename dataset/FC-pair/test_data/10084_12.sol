contract c10084{
    // Lets us calculate what a participants score would be if they ran updateScore.
    // Does NOT perform any state update.
    function viewScore(address _participant)
        public
        view
        returns (uint)
    {
        int8                     lastPlayed     = latestGameFinished;
        // Most recent game played in the tournament (sets bounds for scoring iteration).
        mapping (int8 => bool)   madePrediction = playerMadePrediction[_participant];
        mapping (int8 => string) playerGuesses  = playerPredictions[_participant];
        uint internalResult = 0;
        uint internalStreak = 0;
        for (int8 i = 0; i < lastPlayed; i++) {
            uint j = uint(i);
            uint k = j.add(1);
            uint streak = internalStreak;
            if (!madePrediction[int8(k)]) {
                internalStreak = 0;
            } else {
                string storage playerResult = playerGuesses[int8(k)];
                string storage actualResult = gameResult[int8(k)];
                bool correctGuess = equalStrings(playerResult, actualResult);
                 if (!correctGuess) {
                    internalStreak = 0;
                 } else {
                     // The guess was right.
                     internalStreak++;
                     streak++;
                     if (streak >= 5) {
                         // On a long streak - four points.
                        internalResult += 4;
                     } else {
                         if (streak >= 3) {
                            // On a short streak - two points.
                            internalResult += 2;
              }
                         // Not yet at a streak - standard one point.
                         else { internalResult += 1; }
                     }
                 }
            }
        }
        return internalResult;
    }
}