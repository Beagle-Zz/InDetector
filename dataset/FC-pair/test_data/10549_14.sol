contract c10549{
    /**
     * Create new game
     */
    function createGame(
        uint32 _gameId,
        uint64 _entryFee,
        uint32 _serviceFee,
        uint32 _registrationDueDate
    )
    external
    onlyServer
    {
        require(
            games[_gameId].entryFee == 0
            && _gameId > 0
            && _entryFee > 0
            && _registrationDueDate > 0
        );
        games[_gameId] = Game(GameState.Initialized, _entryFee, _serviceFee, _registrationDueDate, 0x0, 0x0, 0, 0);
    }
}