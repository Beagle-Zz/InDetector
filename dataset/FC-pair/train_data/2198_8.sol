contract c2198{
    /**
     * return the game data when playing
     * 0 start time
     * 1 end time
     * 2 no of player
     * 3 total bet
     * 4 jackpot
     * 5 is ended game boolean
     * 6 game bet value
     **/
    function getGamePlayingStatus() public view returns (uint, uint, uint, uint, uint, uint, uint) {
        return (
        startTime,
        startTime,
        //startTime + AVAILABLE_GAME_TIME,
        playersCount,
        address(this).balance,
        jackpot,
        winnerSide,
        gameBet
        );
    }
}