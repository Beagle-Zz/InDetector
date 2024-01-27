contract c10103{
    // Invoke this function to get *everyone* up to date score-wise.
    // This is probably best used at the end of the tournament, to ensure
    // that prizes are awarded to the correct addresses.
    // Note: this is going to be VERY gas-intensive. Use it if you're desperate
    //         to see how you square up against everyone else if they're slow to
    //         update their own scores. Alternatively, if there's just one or two
    //         stragglers, you can just call updateScore for them alone.
    function updateAllScores()
        public
    {
        uint allPlayers = playerList.length;
        for (uint i = 0; i < allPlayers; i++) {
            address _toScore = playerList[i];
            emit StartAutoScoring(_toScore);
            updateScore(_toScore);
        }
    }
}