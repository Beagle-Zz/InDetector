contract c12677{
    /**
     * @notice Create games session request. msg.value needs to be valid stake value.
     * @param _playerEndHash last entry of players' hash chain.
     * @param _previousGameId player's previous game id, initial 0.
     * @param _createBefore game can be only created before this timestamp.
     * @param _serverEndHash last entry of server's hash chain.
     * @param _serverSig server signature. See verifyCreateSig
     */
    function createGame(
        bytes32 _playerEndHash,
        uint _previousGameId,
        uint _createBefore,
        bytes32 _serverEndHash,
        bytes _serverSig
    )
        public
        payable
        onlyValidValue
        onlyValidHouseStake(activeGames + 1)
        onlyNotPaused
    {
        uint previousGameId = playerGameId[msg.sender];
        Game storage game = gameIdGame[previousGameId];
        require(game.status == GameStatus.ENDED);
        require(previousGameId == _previousGameId);
        require(block.timestamp < _createBefore);
        verifyCreateSig(msg.sender, _previousGameId, _createBefore, _serverEndHash, _serverSig);
        uint gameId = gameIdCntr++;
        playerGameId[msg.sender] = gameId;
        Game storage newGame = gameIdGame[gameId];
        newGame.stake = uint128(msg.value); // It's safe to cast msg.value as it is limited, see onlyValidValue
        newGame.status = GameStatus.ACTIVE;
        activeGames = activeGames + 1;
        // It's safe to cast msg.value as it is limited, see onlyValidValue
        emit LogGameCreated(msg.sender, gameId, uint128(msg.value), _serverEndHash,  _playerEndHash);
    }
}