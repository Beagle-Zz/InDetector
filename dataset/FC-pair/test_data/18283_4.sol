contract c18283{
    /**
     * @dev Force end of game if player does not respond. Only possible after a time period.
     * to give the player a chance to respond.
     * @param _gameType Game type.
     * @param _betNum Bet number.
     * @param _betValue Bet value.
     * @param _balance Current balance.
     * @param _stake Player stake.
     * @param _endInitiatedTime Time server initiated end.
     * @return New game session balance.
     */
    function serverForceGameEnd(
        uint8 _gameType,
        uint _betNum,
        uint _betValue,
        int _balance,
        uint _stake,
        uint _endInitiatedTime
    )
        public
        view
        onlyValidBalance(_balance, _stake)
        returns(int)
    {
        require(_endInitiatedTime + SERVER_TIMEOUT <= block.timestamp);
        require(isValidBet(_gameType, _betNum, _betValue)
                || (_gameType == 0 && _betNum == 0 && _betValue == 0 && _balance == 0));
        // following casts and calculations are safe as ranges are fixed
        // assume player has lost
        int newBalance = _balance - int(_betValue);
        // penalize player as he didn't end game
        newBalance -= NOT_ENDED_FINE;
        // do not allow balance below player stake
        int stake = int(_stake); // safe to cast as stake range is fixed
        if (newBalance < -stake) {
            newBalance = -stake;
        }
        return newBalance;
    }
}