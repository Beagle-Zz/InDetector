contract c18283{
    /**
     * @dev Calculates game result and returns new balance.
     * @param _gameType Type of game.
     * @param _betNum Bet number.
     * @param _betValue Value of bet.
     * @param _balance Current balance.
     * @param _serverSeed Server's seed of current round.
     * @param _playerSeed Player's seed of current round.
     * @return New game session balance.
     */
    function endGameConflict(
        uint8 _gameType,
        uint _betNum,
        uint _betValue,
        int _balance,
        uint _stake,
        bytes32 _serverSeed,
        bytes32 _playerSeed
    )
        public
        view
        onlyValidBet(_gameType, _betNum, _betValue)
        onlyValidBalance(_balance, _stake)
        returns(int)
    {
        assert(_serverSeed != 0 && _playerSeed != 0);
        int newBalance =  processBet(_gameType, _betNum, _betValue, _balance, _serverSeed, _playerSeed);
        // do not allow balance below player stake
        int stake = int(_stake); // safe to cast as stake range is fixed
        if (newBalance < -stake) {
            newBalance = -stake;
        }
        return newBalance;
    }
}