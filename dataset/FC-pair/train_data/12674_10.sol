contract c12674{
    /**
     * @dev Calculate player profit if player has won for game type 2 (dice lower wins).
     * @param _betNum Bet number of player.
     * @param _betValue Value of bet in gwei.
     * @return Players' profit.
     */
    function calculateProfitGameType2(uint _betNum, uint _betValue) private pure returns(int) {
        assert(_betNum >= 0 && _betNum < DICE_RANGE - 1);
        // safe as ranges are fixed
        uint totalWon = _betValue * DICE_RANGE / (DICE_RANGE - _betNum - 1);
        return calcProfitFromTotalWon(totalWon, _betValue);
    }
}