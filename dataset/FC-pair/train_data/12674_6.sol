contract c12674{
    /**
     * @dev Calculate new balance after executing bet.
     * @param _gameType game type.
     * @param _betNum Bet Number.
     * @param _betValue Value of bet.
     * @param _balance Current balance.
     * @param _serverSeed Server's seed
     * @param _playerSeed Player's seed
     * return new balance.
     */
    function processBet(
        uint8 _gameType,
        uint _betNum,
        uint _betValue,
        int _balance,
        bytes32 _serverSeed,
        bytes32 _playerSeed
    )
        private
        pure
        returns (int)
    {
        bool won = hasPlayerWon(_gameType, _betNum, _serverSeed, _playerSeed);
        if (!won) {
            return _balance - int(_betValue); // safe to cast as ranges are fixed
        } else {
            int profit = calculateProfit(_gameType, _betNum, _betValue);
            return _balance + profit;
        }
    }
}