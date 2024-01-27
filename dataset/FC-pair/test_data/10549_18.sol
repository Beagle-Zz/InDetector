contract c10549{
    /**
     * Finish game, store stats hash
     */
    function finishGame(uint32 _gameId, bytes32 _hash) external onlyServer {
        Game storage game = games[_gameId];
        require(
            _gameId > 0
            && game.state < GameState.Finished
        && _hash != 0x0
        );
        game.statsHash = _hash;
        game.state = GameState.Finished;
    }
}