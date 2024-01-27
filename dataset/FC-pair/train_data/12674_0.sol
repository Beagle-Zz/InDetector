contract c12674{
    /**
     * @dev Check if bet is valid.
     * @param _gameType Game type.
     * @param _betNum Number of bet.
     * @param _betValue Value of bet.
     * @return True if bet is valid false otherwise.
     */
    function isValidBet(uint8 _gameType, uint _betNum, uint _betValue) public pure returns(bool) {
        bool validValue = MIN_BET_VALUE <= _betValue && _betValue <= MAX_BET_VALUE;
        bool validGame = false;
        if (_gameType == DICE_LOWER) {
            validGame = _betNum > 0 && _betNum < DICE_RANGE - 1;
        } else if (_gameType == DICE_HIGHER) {
            validGame = _betNum > 0 && _betNum < DICE_RANGE - 1;
        } else {
            validGame = false;
        }
        return validValue && validGame;
    }
}