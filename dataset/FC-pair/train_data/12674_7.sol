contract c12674{
    /**
     * @dev Calculate player profit.
     * @param _gameType type of game.
     * @param _betNum bet numbe.
     * @param _betValue bet value.
     * return profit of player
     */
    function calculateProfit(uint8 _gameType, uint _betNum, uint _betValue) private pure returns(int) {
        uint betValueInGwei = _betValue / 1e9; // convert to gwei
        int res = 0;
        if (_gameType == DICE_LOWER) {
            res = calculateProfitGameType1(_betNum, betValueInGwei);
        } else if (_gameType == DICE_HIGHER) {
            res = calculateProfitGameType2(_betNum, betValueInGwei);
        } else {
            assert(false);
        }
        return res * 1e9; // convert to wei
    }
}