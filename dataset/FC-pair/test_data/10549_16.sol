contract c10549{
    /**
     * Stop participate game, store teams hash
     */
    function startGame(uint32 _gameId, bytes32 _hash) external onlyServer {
        Game storage game = games[_gameId];
        require(
            game.state == GameState.Initialized
            && _gameId > 0
        && _hash != 0x0
        );
        game.teamsHash = _hash;
        game.state = GameState.Started;
    }
}