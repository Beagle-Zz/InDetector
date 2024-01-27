contract c12674{
    /**
     * @dev Calculate winner of game type 1 (roll lower).
     * @param _randomNum 256 bit random number.
     * @param _betNum Bet number.
     * @return True if player has won false if he lost.
     */
    function calculateWinnerGameType1(uint _randomNum, uint _betNum) private pure returns(bool) {
        assert(_betNum > 0 && _betNum < DICE_RANGE);
        uint resultNum = _randomNum % DICE_RANGE; // bias is negligible
        return resultNum < _betNum;
    }
}