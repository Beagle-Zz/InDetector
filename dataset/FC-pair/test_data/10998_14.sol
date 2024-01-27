contract c10998{
    // When the result of a game is known, enter the result.
    function logResult(int8 _gameID, string _winner) 
        isAdministrator
        public {
        require((int8(0) < _gameID) && (_gameID <= 64)
             && _gameID == latestGameFinished + 1);
        // No draws allowed after the qualification stage.
        if (_gameID > 48 && equalStrings(_winner, "DRAW")) {
            revert();
        } else {
            require(!gameFinished[_gameID]);
            gameFinished [_gameID] = true;
            gameResult   [_gameID] = _winner;
            latestGameFinished     = _gameID;
            assert(gameFinished[_gameID]);
        }
    }
}