contract c10084{
    // What was the official result of a game?
    function correctResult(int8 _gameID)
        public
        view
        returns (string)
    {
        return gameResult[_gameID];
    }
}