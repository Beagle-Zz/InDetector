contract c12677{
    /**
     * @notice Cancel active game without playing. Useful if server stops responding before
     * one game is played.
     * @param _gameId Game session id.
     */
    function playerCancelActiveGame(uint _gameId) public {
        address playerAddress = msg.sender;
        uint gameId = playerGameId[playerAddress];
        Game storage game = gameIdGame[gameId];
        require(gameId == _gameId);
        if (game.status == GameStatus.ACTIVE) {
            game.endInitiatedTime = block.timestamp;
            game.status = GameStatus.PLAYER_INITIATED_END;
            emit LogPlayerRequestedEnd(msg.sender, gameId);
        } else if (game.status == GameStatus.SERVER_INITIATED_END && game.roundId == 0) {
            closeGame(game, gameId, 0, playerAddress, ReasonEnded.REGULAR_ENDED, 0);
        } else {
            revert();
        }
    }
}