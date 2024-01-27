contract c12674{
    /**
     * @dev Force end of game if server does not respond. Only possible after a time period
     * to give the server a chance to respond.
     * @param _gameType Game type.
     * @param _betNum Bet number.
     * @param _betValue Value of bet.
     * @param _balance Current balance.
     * @param _endInitiatedTime Time server initiated end.
     * @return New game session balance.
     */
    function playerForceGameEnd(
        uint8 _gameType,
        uint _betNum,
        uint _betValue,
        int _balance,
        uint  _stake,
        uint _endInitiatedTime
    )
        public
        view
        onlyValidBalance(_balance, _stake)
        returns(int)
    {
        require(_endInitiatedTime + PLAYER_TIMEOUT <= block.timestamp);
        require(isValidBet(_gameType, _betNum, _betValue) ||
                (_gameType == 0 && _betNum == 0 && _betValue == 0 && _balance == 0));
        int profit = 0;
        if (_gameType == 0 && _betNum == 0 && _betValue == 0 && _balance == 0) {
            // player cancelled game without playing
            profit = 0;
        } else {
            profit = calculateProfit(_gameType, _betNum, _betValue); // safe to cast as ranges are limited
        }
        // penalize server as it didn't end game
        profit += NOT_ENDED_FINE;
        return _balance + profit;
    }
}