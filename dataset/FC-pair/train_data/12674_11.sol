contract c12674{
    /**
     * @dev Check if player hash won or lost.
     * @return true if player has won.
     */
    function hasPlayerWon(
        uint8 _gameType,
        uint _betNum,
        bytes32 _serverSeed,
        bytes32 _playerSeed
    )
        private
        pure
        returns(bool)
    {
        bytes32 combinedHash = keccak256(abi.encodePacked(_serverSeed, _playerSeed));
        uint randNum = uint(combinedHash);
        if (_gameType == 1) {
            return calculateWinnerGameType1(randNum, _betNum);
        } else if (_gameType == 2) {
            return calculateWinnerGameType2(randNum, _betNum);
        } else {
            assert(false);
        }
    }
}