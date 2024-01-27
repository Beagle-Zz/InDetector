contract c10549{
    /**
     * Cancel game
     */
    function cancelGame(uint32 _gameId) external onlyServer {
        Game storage game = games[_gameId];
        require(
            _gameId > 0
            && game.state < GameState.Finished
        );
        game.state = GameState.Cancelled;
    }
}