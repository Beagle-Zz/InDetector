contract c10084{
    // What was the caller's prediction for a given game?
    function playerGuess(int8 _gameID)
        public
        view
        returns (string)
    {
        return playerPredictions[msg.sender][_gameID];
    }
}