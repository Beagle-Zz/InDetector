contract c12674{
    /**
     * @dev Calculate winner of game type 2 (roll higher).
     * @param _randomNum 256 bit random number.
     * @param _betNum Bet number.
     * @return True if player has won false if he lost.
     */
    function calculateWinnerGameType2(uint _randomNum, uint _betNum) private pure returns(bool) {
        assert(_betNum >= 0 && _betNum < DICE_RANGE - 1);
        uint resultNum = _randomNum % DICE_RANGE; // bias is negligible
        return resultNum > _betNum;
    }
}