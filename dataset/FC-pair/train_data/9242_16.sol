contract c9242{
    /**
    * @dev Start the game
    *
    * Start a new game. Initialize game opponent, game time and status.
    * @param _gameOpponent The game opponent contract address
    * @param _gameTime The game begin time. optional
    */
    function beginGame(address _gameOpponent, uint64 _gameTime) onlyOwner public {
        require(_gameOpponent != address(this));
        // 1514764800 = 2018-01-01
        require(_gameTime == 0 || (_gameTime > 1514764800));
        gameOpponent = _gameOpponent;
        gameTime = _gameTime;
        status = 0;
        emit BeginGame(address(this), _gameOpponent, _gameTime);
    }
}