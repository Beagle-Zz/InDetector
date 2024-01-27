contract c12677{
    /**
     * @dev Conflict handling implementation. Stores game data and timestamp if game
     * is active. If server has already marked conflict for game session the conflict
     * resolution contract is used (compare conflictRes).
     * @param _roundId Round id of bet.
     * @param _gameType Game type of bet.
     * @param _num Number of bet.
     * @param _value Value of bet.
     * @param _balance Balance before this bet.
     * @param _playerHash Hash of player's seed for this bet.
     * @param _playerSeed Player's seed for this bet.
     * @param _gameId game Game session id.
     * @param _playerAddress Player's address.
     */
    function playerEndGameConflictImpl(
        uint32 _roundId,
        uint8 _gameType,
        uint16 _num,
        uint _value,
        int _balance,
        bytes32 _playerHash,
        bytes32 _playerSeed,
        uint _gameId,
        address _playerAddress
    )
        private
    {
        uint gameId = playerGameId[_playerAddress];
        Game storage game = gameIdGame[gameId];
        int maxBalance = conflictRes.maxBalance();
        require(gameId == _gameId);
        require(_roundId > 0);
        require(keccak256(abi.encodePacked(_playerSeed)) == _playerHash);
        require(-int(game.stake) <= _balance && _balance <= maxBalance); // save to cast as ranges are fixed
        require(conflictRes.isValidBet(_gameType, _num, _value));
        require(int(game.stake) + _balance - int(_value) >= 0); // save to cast as ranges are fixed
        if (game.status == GameStatus.SERVER_INITIATED_END && game.roundId == _roundId) {
            game.playerSeed = _playerSeed;
            endGameConflict(game, gameId, _playerAddress);
        } else if (game.status == GameStatus.ACTIVE
                || (game.status == GameStatus.SERVER_INITIATED_END && game.roundId < _roundId)) {
            game.status = GameStatus.PLAYER_INITIATED_END;
            game.endInitiatedTime = block.timestamp;
            game.roundId = _roundId;
            game.gameType = _gameType;
            game.betNum = _num;
            game.betValue = _value;
            game.balance = _balance;
            game.playerSeed = _playerSeed;
            game.serverSeed = bytes32(0);
            emit LogPlayerRequestedEnd(msg.sender, gameId);
        } else {
            revert();
        }
    }
}