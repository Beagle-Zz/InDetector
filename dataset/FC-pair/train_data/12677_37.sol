contract c12677{
    /**
     * @dev Cancel active game without playing. Useful if player starts game session and
     * does not play.
     * @param _playerAddress Players' address.
     * @param _gameId Game session id.
     */
    function serverCancelActiveGame(address _playerAddress, uint _gameId) public onlyServer {
        uint gameId = playerGameId[_playerAddress];
        Game storage game = gameIdGame[gameId];
        require(gameId == _gameId);
        if (game.status == GameStatus.ACTIVE) {
            game.endInitiatedTime = block.timestamp;
            game.status = GameStatus.SERVER_INITIATED_END;
            emit LogServerRequestedEnd(msg.sender, gameId);
        } else if (game.status == GameStatus.PLAYER_INITIATED_END && game.roundId == 0) {
            closeGame(game, gameId, 0, _playerAddress, ReasonEnded.REGULAR_ENDED, 0);
        } else {
            revert();
        }
    }
}